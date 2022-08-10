import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  TextInputType? textInputType;
  final double borderRadius;
  final String hintText;
  final String labelText;
  Icon? prefixIcon;
  IconButton? suffixIcon;
  InputDecoration? decoration;
  FormFieldValidator<String>? validator;
  // String? Function(String?)? validator;
  // final String defaultText;
  // final FocusNode focusNode;
  bool? obscureText;
  TextStyle? style;
  bool? filled;
  Color? filledColor;
  TextEditingController? controller;
  // Function? functionValidate;
  // final String parametersValidate;
  // final TextInputAction actionKeyboard;
  // final Function onSubmitField;
  // final Function onFieldTap;
  TextFormWidget({Key? key,
    required this.hintText,
    required this.labelText,
    this.style,
    this.decoration,
    this.filledColor,
    this.filled,
    required this.borderRadius,
    this.prefixIcon,
    this.controller,
    this.obscureText,
    this.suffixIcon,
    this.validator,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText??false,
      decoration:  InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: filled,
          fillColor: filledColor,
          labelText: labelText,
          hintText: hintText,
          border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius)
          )
      ),
    );
  }
}
