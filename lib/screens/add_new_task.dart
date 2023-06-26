import 'package:flutter/material.dart';
import 'package:task_list_2/handler/task_handler.dart';
import 'package:task_list_2/widgets/ui_custom_drop_down_widget.dart';

import '../configs/constants.dart';
import '../model/task_model.dart';
import '../widgets/ui_svg_icon.dart';
import '../widgets/ui_text_field.dart';
import '../widgets/ui_text_widget.dart';
import '../widgets/ui_vertical_space.dart';

class AddNewTask extends StatelessWidget {
  final TaskHandler taskHandler;
  const AddNewTask({
    super.key,
    required this.taskHandler,
  });

  @override
  Widget build(BuildContext context) {
    FocusNode taskTitleFocusNode = FocusNode();
    TextEditingController taskTitleController = TextEditingController();
    TextEditingController taskDescriptionController = TextEditingController();
    FocusNode taskDescriptionFocusNode = FocusNode();
    String type = "";
    String timeFrame = "";
    String priority = "";

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
                child: UITextWidget(
                  text: "New Task",
                  textColor: primaryColor,
                  fontSize: 30,
                  fontFamily: fontNamePoppins,
                  fontWeight: FontWeight.w600,
                  // line height
                ),
              ),
              const UIVerticalSpace(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UITextWidget(
                      text: "Task",
                      textColor: textColor3,
                      fontSize: 20,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.normal,
                      // line height
                    ),
                    const UIVerticalSpace(height: 4),
                    UITextFieldWidget(
                      text: "Text",
                      focusNode: taskTitleFocusNode,
                      controller: taskTitleController,
                    ),
                    const UIVerticalSpace(height: 24),
                    UITextWidget(
                      text: "Type",
                      textColor: textColor3,
                      fontSize: 20,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.normal,
                      // line height
                    ),
                    const UIVerticalSpace(height: 4),
                    CustomDropdown(
                      onDataReceived: (option) {
                        type = option;
                      },
                      options: const [
                        'Work',
                        'Personal Project',
                        'Self',
                      ],
                    ),
                    const UIVerticalSpace(height: 24),
                    UITextWidget(
                      text: "Priority",
                      textColor: textColor3,
                      fontSize: 20,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.normal,
                      // line height
                    ),
                    const UIVerticalSpace(height: 4),
                    CustomDropdown(
                      onDataReceived: (option) {
                        priority = option;
                      },
                      options: const [
                        'Needs done',
                        'Nice to have',
                        'Nice idea',
                      ],
                    ),
                    const UIVerticalSpace(height: 24),
                    UITextWidget(
                      text: "Timeframe",
                      textColor: textColor3,
                      fontSize: 20,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.normal,
                      // line height
                    ),
                    const UIVerticalSpace(height: 4),
                    CustomDropdown(
                      onDataReceived: (option) {
                        timeFrame = option;
                      },
                      options: const [
                        'Today',
                        '3 days',
                        'Tonight',
                        'Week',
                        'Month',
                      ],
                    ),
                    const UIVerticalSpace(height: 24),
                    UITextWidget(
                      text: "Description",
                      textColor: textColor3,
                      fontSize: 20,
                      fontFamily: fontNamePoppins,
                      fontWeight: FontWeight.normal,
                      // line height
                    ),
                    const UIVerticalSpace(height: 4),
                    UITextFieldWidget(
                      text: "",
                      haveMaxLines: true,
                      focusNode: taskDescriptionFocusNode,
                      controller: taskDescriptionController,
                    ),
                    const UIVerticalSpace(height: 24),
                  ],
                ),
              ),
              const UIVerticalSpace(height: 140),
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            taskHandler.createRecord(
              TaskModel(
                type: type,
                priority: priority,
                taskTitle: taskTitleController.text,
                dueDate: timeFrame,
                description: taskDescriptionController.text,
                isChecked: false,
              ),
            );
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 20,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
                borderRadius: BorderRadius.circular(12)),
            height: 50,
            margin: const EdgeInsets.only(left: 40, right: 8),
            child: UITextWidget(
                text: "Submit",
                textColor: whiteColor,
                fontSize: 20,
                fontFamily: fontNamePoppins,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
