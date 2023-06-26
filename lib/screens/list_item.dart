import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/constants.dart';
import '../handler/task_handler.dart';
import '../model/task_model.dart';
import '../widgets/ui_svg_icon.dart';
import '../widgets/ui_text_widget.dart';
import '../widgets/ui_vertical_space.dart';
import 'add_new_task.dart';
import 'task_preview.dart';

class ListTaskItem extends StatelessWidget {
  const ListTaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    final taskHandler = Provider.of<TaskHandler>(context);
    Future<List<TaskModel>> loadJsonData() async {
      final taskList = await taskHandler.getAllTasks();

      return taskList;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UIVerticalSpace(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const UISvgIcon(
                    name: "assets/icons/chevron_left.svg",
                    height: 36,
                    width: 36,
                  ),
                ),
              ),
              const UIVerticalSpace(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UITextWidget(
                          text: "Tasks",
                          textColor: primaryColor,
                          fontSize: 30,
                          fontFamily: fontNamePoppins,
                          fontWeight: FontWeight.w600,
                        ),
                        UITextWidget(
                          text: "6 Tasks",
                          textColor: textColor2,
                          fontSize: 18,
                          fontFamily: fontNamePoppins,
                          fontWeight: FontWeight.normal,
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNewTask(
                              taskHandler: taskHandler,
                            ),
                          ),
                        );
                      },
                      child: const UISvgIcon(
                        name: "assets/icons/add-circle-svgrepo-com.svg",
                        height: 56,
                        width: 56,
                      ),
                    )
                  ],
                ),
              ),
              FutureBuilder<List<TaskModel>>(
                future: loadJsonData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<TaskModel> jsonData = snapshot.data!;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: jsonData.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return TaskListItem(
                            task: jsonData[index],
                            index: index,
                            taskHandler: taskHandler,
                          );
                        });
                  } else if (snapshot.hasError) {
                    return const Text('Error loading JSON');
                  }
                  return const CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskListItem extends StatelessWidget {
  final TaskModel task;
  final int index;
  final TaskHandler taskHandler;
  const TaskListItem({
    super.key,
    required this.task,
    required this.index,
    required this.taskHandler,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskPreviewScreen(
              task: task,
              index: index,
              taskHandler: taskHandler,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-1.00, 0.04),
            end: Alignment(1, -0.04),
            colors: [
              Colors.white,
              Color(0xFFEDF3FF),
            ],
            // transform: GradientRotation(270 * 3.14159 / 180),
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x00c00000),
              blurRadius: 20,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          task.taskTitle,
                          style: TextStyle(
                            color: textColor3,
                            fontSize: 20,
                            fontFamily: fontNamePoppins,
                            fontWeight: FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      UITextWidget(
                        text: task.dueDate,
                        textColor: textColor2,
                        fontSize: 14,
                        fontFamily: fontNamePoppins,
                        fontWeight: FontWeight.normal,
                      )
                    ],
                  )
                ],
              ),
              const UISvgIcon(name: "assets/icons/chevron_right.svg")
            ],
          ),
        ),
      ),
    );
  }
}
