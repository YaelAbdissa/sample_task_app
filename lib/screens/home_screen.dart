import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_2/widgets/ui_horizontal_space.dart';
import 'package:task_list_2/widgets/ui_svg_icon.dart';

import '../configs/constants.dart';
import '../handler/task_handler.dart';
import '../widgets/ui_text_widget.dart';
import '../widgets/ui_vertical_space.dart';
import 'list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskHandler = Provider.of<TaskHandler>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UIVerticalSpace(height: 32),
              UITextWidget(
                fontFamily: fontNamePoppins,
                fontSize: 32,
                fontWeight: FontWeight.w600,
                text: 'Task App',
                textColor: primaryColor,
              ),
              const UIVerticalSpace(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListTaskItem(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  decoration: BoxDecoration(
                    // color: whiteColor,

                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        whiteColor,
                        const Color(0xffEDF3FF),
                      ],
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // icon
                          Image.asset("assets/icons/task.png"),

                          const UIHorizontalSpace(width: 24),
                          // column
                          Column(
                            children: [
                              UITextWidget(
                                text: "Tasks",
                                textColor: textColor,
                                fontSize: 22,
                                fontFamily: fontNamePoppins,
                                fontWeight: FontWeight.normal,
                              ),
                              UITextWidget(
                                text:
                                    "${taskHandler.getAllTasks().length} Tasks",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
