import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';

class CustomNumberTextfield extends StatefulWidget {
  const CustomNumberTextfield(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String? hintText;

  @override
  State<CustomNumberTextfield> createState() =>_CustomNumberTextfield();
}

class _CustomNumberTextfield extends State<CustomNumberTextfield> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      '+971',
      '+972',
      '+973',
    ];
    String? selectedValue = '+971';
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              customButton: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      selectedValue,
                      style:
                          getHintTextStyle(context).copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Center(
                      child: Container(
                        color: Colors.grey,
                        height: 18,
                        width: 1,
                      ),
                    ),
                  ],
                ),
              ),
              style: getHintTextStyle(context).copyWith(color: Colors.black, fontSize: 16),
              buttonStyleData: null,
              iconStyleData: const IconStyleData(iconSize: 0),
              hint: Text(
                selectedValue,
                style: getInfoStyle(context),
              ),
              items: items
                  .map(
                    (String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                });
              },
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 500,
                offset: const Offset(-20, 0),
                decoration: const BoxDecoration(color: backgroundColor),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: textFieldBorderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        hintText: widget.hintText,
        hintStyle: getHintTextStyle(context),
      ),
    );
  }
}
