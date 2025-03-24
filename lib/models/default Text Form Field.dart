import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField({
    this.maxLine,
    this.suffixIcon,
    this.obscureText,
    this.radius,
    this.validator,
    required this.controller,
    required this.type,
    this.labelText,
    this.prefixIcon,
    this.hintText,
    this.suffixIconOnPressed,
     this.borderSideColor,
    this.borderWidth
  });
  Color? borderSideColor;
  TextInputType? type;
  bool? obscureText;
  String? labelText;
  String? hintText;
  double? radius;
  double? borderWidth;
  IconData? suffixIcon;
  IconData? prefixIcon;
  Function()? suffixIconOnPressed;
  int? maxLine;
  TextEditingController? controller;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLines: maxLine ?? 1,
      controller: controller,
      keyboardType: type,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            width: borderWidth??1,
            color: borderSideColor??const Color.fromRGBO(34, 150, 242, 1.0),
          ),
        ),
        suffixIcon:
            IconButton(icon: Icon(suffixIcon), onPressed: suffixIconOnPressed),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 16),
        ),
      ),
    );
  }
}
