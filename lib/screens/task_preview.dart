import 'package:flutter/material.dart';
import 'package:task_list_2/handler/task_handler.dart';
import 'package:task_list_2/model/task_model.dart';

import '../configs/constants.dart';
import '../widgets/horizontal_line.dart';
import '../widgets/ui_svg_icon.dart';
import '../widgets/ui_text_widget.dart';
import '../widgets/ui_vertical_space.dart';

class TaskPreviewScreen extends StatelessWidget {
  final TaskModel task;
  final TaskHandler taskHandler;
  final int index;
  const TaskPreviewScreen({
    super.key,
    required this.task,
    required this.index,
    required this.taskHandler,
  });

  @override
  Widget build(BuildContext context) {
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
                    UITextWidget(
                      text: "Task Preview",
                      textColor: primaryColor,
                      fontSize: 30,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.w600,
                    ),
                    GestureDetector(
                      onTap: () {
                        taskHandler.deleteRecord(index);
                        Navigator.pop(context);
                      },
                      child: const UISvgIcon(
                        name: "assets/icons/delete_icon.svg",
                        height: 28,
                        width: 28,
                      ),
                    )
                  ],
                ),
              ),
              const UIVerticalSpace(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UITextWidget(
                      text: "Task",
                      textColor: textColor,
                      fontSize: 18,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.w300,
                    ),
                    const UIVerticalSpace(height: 4),
                    UITextWidget(
                      text: task.taskTitle,
                      textColor: textColor,
                      fontSize: 22,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.normal,
                    ),
                    const UIVerticalSpace(height: 20),
                    const UIHorizontalLine(),
                    const UIVerticalSpace(height: 24),
                    UITextWidget(
                      text: "Type",
                      textColor: textColor,
                      fontSize: 18,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.w300,
                    ),
                    const UIVerticalSpace(height: 4),
                    UITextWidget(
                      text: task.type,
                      textColor: textColor,
                      fontSize: 22,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.normal,
                    ),
                    const UIVerticalSpace(height: 20),
                    const UIHorizontalLine(),
                    const UIVerticalSpace(height: 24),
                    UITextWidget(
                      text: "Priority",
                      textColor: textColor,
                      fontSize: 18,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.w300,
                    ),
                    const UIVerticalSpace(height: 4),
                    UITextWidget(
                      text: task.priority,
                      textColor: textColor,
                      fontSize: 22,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.normal,
                    ),
                    const UIVerticalSpace(height: 20),
                    const UIHorizontalLine(),
                    const UIVerticalSpace(height: 24),
                    UITextWidget(
                      text: "Timeframe",
                      textColor: textColor,
                      fontSize: 18,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.w300,
                    ),
                    const UIVerticalSpace(height: 4),
                    UITextWidget(
                      text: task.dueDate,
                      textColor: textColor,
                      fontSize: 22,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.normal,
                    ),
                    const UIVerticalSpace(height: 20),
                    const UIHorizontalLine(),
                    const UIVerticalSpace(height: 24),
                    UITextWidget(
                      text: "Description",
                      textColor: textColor,
                      fontSize: 18,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.w300,
                    ),
                    const UIVerticalSpace(height: 4),
                    UITextWidget(
                      text: task.description,
                      textColor: textColor,
                      fontSize: 22,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.normal,
                    ),
                    const UIVerticalSpace(height: 20),
                    const UIVerticalSpace(height: 24),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
