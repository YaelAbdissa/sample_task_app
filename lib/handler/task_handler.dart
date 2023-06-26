import 'dart:convert';

import 'package:task_list_2/model/task_model.dart';
import '../model/task.dart' as taskList;

class TaskHandler {
  List<dynamic> tasks = taskList.tasks;

  Future<List<TaskModel>> getAllTasks() async {
    final jsonList = tasks;
    return jsonList.map((json) => TaskModel.fromJson(json)).toList();
  }

  Future<List<dynamic>> getAll() async {
    final jsonList = tasks;

    return jsonList;
  }

  void createRecord(TaskModel task) async {
    final jsonList = tasks;
    jsonList.add(task.toJson());

    final newJsonData = json.encode(jsonList);
  }

  Future<void> saveJsonData(String jsonData) async {
    // // final jsonFile = await rootBundle.loadString('assets/json/task.json');
    // final file = File("assets/json/task.json");
    // final jsonString = json.encode(jsonData);
    // await file.writeAsString(jsonString);
    // // final file = await File(jsonFile).writeAsString(jsonData);
  }

  void deleteRecord(int index) async {
    tasks.removeAt(index);

    final newJsonData = json.encode(tasks);
    await saveJsonData(newJsonData);
  }

  void updateRecord(int index, TaskModel updatedTask) async {
    tasks[index] = updatedTask.toJson();

    final newJsonData = json.encode(tasks);
    await saveJsonData(newJsonData);
  }
}
