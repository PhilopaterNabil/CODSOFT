import 'dart:developer';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do/controllers/task_controller.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/services/notification_services.dart';
import 'package:to_do/services/theme_services.dart';
import 'package:to_do/ui/pages/add_task_page.dart';
import 'package:to_do/ui/size_config.dart';
import 'package:to_do/ui/theme.dart';
import 'package:to_do/ui/widgets/button.dart';
import 'package:to_do/ui/widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotifyHelper notifyHelper;
  @override
  void initState() {
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestAndroidPermissions();
    notifyHelper.requestIOSPermissions();
    _taskController.getTasks();
    super.initState();
  }

  final TaskController _taskController = Get.put(TaskController());
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.dialogBackgroundColor,
      appBar: _customAppBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          SizedBox(height: getProportionateScreenHeight(10)),
          _showTasks(),
        ],
      ),
    );
  }

  AppBar _customAppBar() {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/person.jpeg'),
            radius: 20,
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: context.theme.dialogBackgroundColor,
      forceMaterialTransparency: true,
      actions: [
        IconButton(
          onPressed: () {
            ThemeServices().switchTheme();
          },
          icon: Get.isDarkMode
              ? const Icon(
                  Icons.sunny,
                  color: Colors.limeAccent,
                )
              : const Icon(
                  Icons.nights_stay,
                  color: Colors.indigo,
                ),
        ),
        IconButton(
          onPressed: () => _showDeleteConfirmationDialog(context),
          icon: const Icon(
            Icons.cleaning_services_outlined,
            color: Colors.red,
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  _addTaskBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: headingStyle,
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          MyButton(
            label: '+ Add Task',
            onTap: () async {
              await Get.to(() => const AddTaskPage());
              _taskController.getTasks();
            },
          ),
        ],
      ),
    );
  }

  _addDateBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: SizeConfig.orientation == Orientation.landscape
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.height * 0.12,
        width: SizeConfig.orientation == Orientation.landscape
            ? MediaQuery.of(context).size.width * 0.1
            : MediaQuery.of(context).size.width * 0.19,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        dayTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        monthTextStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        onDateChange: (newDate) {
          setState(() => _selectedDate = newDate);
        },
      ),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(
        () {
          if (_taskController.taskList.isEmpty) {
            return _noTaskMsg();
          } else {
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                scrollDirection: SizeConfig.orientation == Orientation.landscape
                    ? Axis.horizontal
                    : Axis.vertical,
                itemCount: _taskController.taskList.length,
                itemBuilder: (context, index) {
                  var task = _taskController.taskList[index];

                  if (task.repeat == 'Daily' ||
                      task.date == DateFormat.yMd().format(_selectedDate) ||
                      (task.repeat == 'Weekly' &&
                          _selectedDate
                                      .difference(
                                          DateFormat.yMd().parse(task.date!))
                                      .inDays %
                                  7 ==
                              0) ||
                      (task.repeat == 'Monthly' &&
                          DateFormat.yMd().parse(task.date!).day ==
                              _selectedDate.day)) {
                    var cleanStartTime = task.startTime!
                        .replaceAll(RegExp(r'[^\x20-\x7E]'), '')
                        .replaceAll(RegExp(r'\u00A0'), ' ')
                        .replaceAll(RegExp(r'\s+'), ' ')
                        .trim();

                    try {
                      var date = DateFormat.jm().parse(cleanStartTime);
                      var myTime = DateFormat('HH:mm').format(date);

                      notifyHelper.scheduledNotification(
                        int.parse(myTime.split(':')[0]),
                        int.parse(myTime.split(':')[1]),
                        task,
                      );
                    } catch (e) {
                      log('Error: $e');
                    }

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 800),
                      child: SlideAnimation(
                        verticalOffset: 300,
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          delay: Duration(milliseconds: 50 * (index + 1)),
                          curve: Curves.easeInCirc,
                          child: GestureDetector(
                            onTap: () => showBottomSheet(context, task),
                            child: TaskTile(task: task),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: SizeConfig.orientation == Orientation.landscape
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  SizeConfig.orientation == Orientation.landscape
                      ? const SizedBox(height: 6)
                      : const SizedBox(height: 180),
                  SvgPicture.asset(
                    'assets/images/task.svg',
                    color: primaryClr.withOpacity(0.5),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(
                      'You do not have any tasks yet!\nAdd new tasks to make your days productive',
                      textAlign: TextAlign.center,
                      style: subTitleStyle,
                    ),
                  ),
                  SizeConfig.orientation == Orientation.landscape
                      ? const SizedBox(height: 120)
                      : const SizedBox(height: 180),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> _onRefresh() async {
    _taskController.getTasks();
  }

  showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 4),
          width: SizeConfig.screenWidth,
          height: (SizeConfig.orientation == Orientation.landscape)
              ? (task.isCompleted == 1
                  ? SizeConfig.screenHeight * 0.6
                  : SizeConfig.screenHeight * 0.8)
              : (task.isCompleted == 1
                  ? SizeConfig.screenHeight * 0.24
                  : SizeConfig.screenHeight * 0.32),
          color: Get.isDarkMode ? darkHeaderClr : Colors.white,
          child: Column(
            children: [
              Flexible(
                child: Container(
                  height: 6,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              task.isCompleted == 1
                  ? Container()
                  : _buildBottomSheet(
                      label: 'Task Completed',
                      onTap: () {
                        _taskController.markUsCompleted(task);
                        Get.back();
                      },
                      color: Colors.green,
                    ),
              _buildBottomSheet(
                label: 'Delete Task',
                onTap: () {
                  _taskController.deleteTask(task);
                  Get.back();
                },
                color: Colors.red[300]!,
              ),
              Divider(color: Get.isDarkMode ? Colors.grey : darkGreyClr),
              _buildBottomSheet(
                label: 'Cancel',
                onTap: () {
                  Get.back();
                },
                color: primaryClr,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildBottomSheet({
    required String label,
    required Function() onTap,
    required Color color,
    bool isClose = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 65,
        width: SizeConfig.screenWidth * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : color,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : color,
        ),
        child: Center(
          child: Text(
            label,
            style:
                isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            height: SizeConfig.orientation == Orientation.landscape
                ? MediaQuery.sizeOf(context).height * 0.5
                : MediaQuery.sizeOf(context).height * 0.25,
            width: SizeConfig.orientation == Orientation.landscape
                ? MediaQuery.sizeOf(context).width * 0.4
                : MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Confirm Deletion of All Tasks',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  'Are you sure you want to delete all tasks?',
                  textAlign: TextAlign.center,
                  style: subTitleStyle,
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        notifyHelper.cancelAllNotification();
                        _taskController.deleteALLTasks();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Delete All'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
