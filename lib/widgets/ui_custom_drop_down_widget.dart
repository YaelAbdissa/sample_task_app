import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../configs/constants.dart';

class CustomDropdown extends StatefulWidget {
  final List options;
  final void Function(String) onChanged;
  const CustomDropdown(
      {super.key, required this.options, required this.onChanged});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedOption;
  bool dropdownOpened = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dropdownOpened ? 220 : null,
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: dropdownOpened ? primaryColor : Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              selectedOption ?? '',
              style: const TextStyle(
                fontSize: 18.0,
                fontFamily: fontNamePoppins,
                fontWeight: FontWeight.normal,
              ),
            ),
            trailing: SvgPicture.asset(dropdownOpened
                ? "assets/icons/chevron_up.svg"
                : "assets/icons/chevron_down.svg"),
            onTap: () {
              setState(() {
                dropdownOpened = !dropdownOpened;
              });
            },
          ),
          if (dropdownOpened)
            Container(
              color: whiteColor,
              height: 150.0,
              child: ListView.builder(
                itemCount: widget.options.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      widget.options[index],
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontFamily: fontNamePoppins,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedOption = widget.options[index];
                        dropdownOpened = false;
                      });
                      widget.onChanged(selectedOption!);
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
