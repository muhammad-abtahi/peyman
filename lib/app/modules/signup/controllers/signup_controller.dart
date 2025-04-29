import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';

class SignUpController extends GetxController {
  RxInt emiratesRadioId = 0.obs;
  RxInt passportRadioId = 1.obs;
  RxInt selectedId = 0.obs;

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController emiratesId = TextEditingController();
  TextEditingController residenceAddress = TextEditingController();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  final List<String> items = [
    '+971',
    '+972',
    '+973',
  ];
  RxString? selectedValue = '+971'.obs;

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

  Widget numberSelecter(BuildContext context) {
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
            padding: const EdgeInsets.only(left: 20.0, right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedValue?.value ?? "",
                  style: getHintTextStyle(context)
                      .copyWith(fontWeight: FontWeight.bold),
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
              .copyWith(color: Colors.black, fontSize: 16),
          buttonStyleData: null,
          iconStyleData: const IconStyleData(iconSize: 0),
          hint: Text(
            selectedValue?.value ?? "",
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
          value: selectedValue?.value,
          onChanged: (String? value) {
            selectedValue?.value = value!;
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
            padding: const EdgeInsets.only(left: 20.0, right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedValueId?.value ?? "",
                  style: getHintTextStyle(context).copyWith(),
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
              .copyWith(color: Colors.black, fontSize: 16),
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
