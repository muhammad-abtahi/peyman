import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';

class LoginController extends GetxController {
  RxInt emiratesRadioId = 0.obs;
  RxInt dateOfBirthRadioId = 1.obs;
  RxInt passportRadioId = 2.obs;

  RxInt selectedId = 0.obs;
  TextEditingController date = TextEditingController();
  TextEditingController emiratesId = TextEditingController();
  TextEditingController passportNo = TextEditingController();

  final List<String> idItems = [
    '784',
    '785',
    '786',
  ];
  RxString? selectedValueId = '784'.obs;

  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != date) {
      date.text = DateFormat("MM-dd-yy").format(picked);
      update();
    }
  }

  Widget emiratesIdSelecter(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          customButton: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedValueId?.value ?? "",
                  style: getHintTextStyle(context).copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17),
                ),
                const SizedBox(width: 8),
                Center(
                  child: Container(
                    color: Colors.grey,
                    height: 18,
                    width: .75,
                  ),
                ),
              ],
            ),
          ),
          style: getHintTextStyle(context)
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          buttonStyleData: null,
          iconStyleData: const IconStyleData(iconSize: 0),
          hint: Text(
            selectedValueId?.value ?? "",
            style: getInfoStyle(context),
          ),
          items: idItems
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
          value: selectedValueId?.value,
          onChanged: (String? value) {
            selectedValueId?.value = value!;
            update();
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
    );
  }
}
