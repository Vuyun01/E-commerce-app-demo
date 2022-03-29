import 'package:e_commerce_app_demo/components/custom_suffix_icon.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({ 
    Key? key, 
    required this.onSaved, 
    required this.onChanged, 
    required this.validator, 
    required this.hintText, 
    required this.label, 
    required this.iconPath,
    this.isPassword = false, 
    this.textInputType,
  }) : super(key: key);

  final void Function(String? value) onSaved;
  final void Function(String? value) onChanged;
  final String? Function(String? value) validator;
  final String hintText;
  final String label;
  final String iconPath;
  final bool isPassword;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isPassword ? null : textInputType,
      obscureText: isPassword,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        //FloatingLabelBehavior won't work if difining it in theme_
        floatingLabelBehavior: FloatingLabelBehavior.always, //alway show label text on border line
        floatingLabelStyle: TextStyle(color: kTextColor),
        suffixIcon: CustomSuffixIcon(pathIcon: iconPath,)
      )
    );
  }
}