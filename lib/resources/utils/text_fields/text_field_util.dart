import 'package:flutter/material.dart';
import 'package:mobile_shop_app/resources/constants/colors.dart';

class EditTextUtils {
  TextFormField getCustomEditTextArea({
    BuildContext? context,
    String labelValue = "",
    String hintValue = "",
    Function? validator,
    IconData? icon,
    bool? validation,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    String? validationErrorMsg,
  }) {
    return TextFormField(
      controller: controller,
      cursorColor: ConstColor.primaryColor,
      cursorHeight: 25,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: ConstColor.primaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixStyle: TextStyle(color: ConstColor.primaryColor),
        // fillColor: Colors.white.withOpacity(0.6),
        labelStyle: TextStyle(color: ConstColor.primaryColor),
        focusColor: ConstColor.primaryColor,
        filled: true,
        isDense: true,
        border: buildOutlineInputBorder(ConstColor.primaryColor),
        disabledBorder: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(8.0),
          ),
          borderSide: new BorderSide(
            color: ConstColor.primaryColor,
            width: 1.0,
          ),
        ),
        focusedBorder: buildOutlineInputBorder(ConstColor.primaryColor),
        hintText: hintValue,
        labelText: labelValue,
      ),
      validator: validator as String? Function(String?)?,
    );
  }
}

OutlineInputBorder buildOutlineInputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: color,
      width: 1.4,
    ),
  );
}