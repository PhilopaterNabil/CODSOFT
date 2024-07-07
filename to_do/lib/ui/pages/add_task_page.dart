import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do/controllers/task_controller.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/ui/theme.dart';
import 'package:to_do/ui/widgets/button.dart';
import 'package:to_do/ui/widgets/custom_snack_bar_content.dart';
import 'package:to_do/ui/widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20, 30, 60];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weakly', 'Monthly'];

  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.dialogBackgroundColor,
      appBar: _customAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Add Task', style: headingStyle),
              InputField(
                title: 'Title',
                hint: 'Enter title here',
                controller: _titleController,
              ),
              InputField(
                title: 'Note',
                hint: 'Enter note here',
                controller: _noteController,
              ),
              InputField(
                title: 'Date',
                hint: DateFormat('dd/MM/yyyy').format(_selectedDate),
                widget: IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    _getDateFromUser();
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: InputField(
                      title: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InputField(
                title: 'Remind',
                hint: '$_selectedRemind minutes early',
                paddingRight: true,
                widget: DropdownButton(
                  dropdownColor: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                  items: remindList
                      .map<DropdownMenuItem<String>>(
                        (value) => DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(
                            '$value',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  underline: Container(height: 0),
                  style: subTitleStyle,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedRemind = int.parse(newValue!);
                    });
                  },
                ),
              ),
              InputField(
                title: 'Repeat',
                hint: _selectedRepeat,
                paddingRight: true,
                widget: DropdownButton(
                  dropdownColor: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                  items: repeatList
                      .map<DropdownMenuItem<String>>(
                        (value) => DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  underline: Container(height: 0),
                  style: subTitleStyle,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedRepeat = newValue!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPallete(),
                  MyButton(
                    label: 'Create Task',
                    onTap: () {
                      _validateData();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _customAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: primaryClr,
        ),
      ),
      elevation: 0,
      backgroundColor: context.theme.dialogBackgroundColor,
      forceMaterialTransparency: true,
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/person.jpeg'),
          radius: 20,
        ),
        SizedBox(width: 20),
      ],
    );
  }

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _AddTasksToDb();
      Get.back();
    } else {
      _showSnakBarFlashBar();
      // Get.snackbar(
      //   'Required',
      //   'Please fill all the fields',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.white,
      //   colorText: pinkClr,
      //   icon: const Icon(
      //     Icons.warning_amber_rounded,
      //     color: Colors.red,
      //   ),
      // );
    }
  }

  _showSnakBarFlashBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: CustomSnackBarContent(
          errorText: 'Required fields!',
          message: 'Please fill Title and Note fields',
        ),
        duration: Duration(seconds: 2),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  _AddTasksToDb() async {
    try {
      int value = await _taskController.addTask(
        task: Task(
          title: _titleController.text,
          note: _noteController.text,
          isCompleted: 0,
          date: DateFormat.yMd().format(_selectedDate),
          startTime: _startTime,
          endTime: _endTime,
          color: _selectedColor,
          remind: _selectedRemind,
          repeat: _selectedRepeat,
        ),
      );
      log('My id is $value');
    } catch (e) {
      log('Error: $e');
    }
  }

  SingleChildScrollView _colorPallete() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Color', style: titleStyle),
          const SizedBox(height: 8),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Wrap(
              children: List<Widget>.generate(
                kColors.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, bottom: 8),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: kColors[index % kColors.length],
                      child: _selectedColor == index
                          ? const Icon(
                              Icons.done,
                              size: 20,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2125),
    );
    if (pickedDate != null) {
      setState(() => _selectedDate = pickedDate);
    } else {
      log('Date is not selected');
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay.fromDateTime(
              DateTime.now().add(const Duration(minutes: 15))),
    );
    String formatedTime = pickedTime!.format(context);
    if (isStartTime) {
      setState(() => _startTime = formatedTime);
    } else if (!isStartTime) {
      setState(() => _endTime = formatedTime);
    } else {
      log('Time is not selected');
    }
  }
}
