import 'package:get/get.dart';
import 'package:to_do/db/db_helper.dart';
import 'package:to_do/models/task.dart';

class TaskController extends GetxController {
  final RxList<Task> taskList = <Task>[].obs;

  Future<int> addTask({required Task task}) {
    return DBHelper.insert(task);
  }

  Future<void> getTasks() async {
    final List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((e) => Task.fromJson(e)).toList());
  }

  void deleteTask(Task task) async{
    await DBHelper.delete(task);
    getTasks();
  }

  void deleteALLTasks() async{
    await DBHelper.deleteAll();
    getTasks();
  }

  void markUsCompleted(Task task) async {
    await DBHelper.update(task.id!);
    getTasks();
  }
}
