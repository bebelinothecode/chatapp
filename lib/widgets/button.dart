import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double? fontSize;
  IconData? icon;
  final Color? textColor;
  String text;
  final Function()? onTap;
  final Color? backgroundColor;
  Button({Key? key, this.fontSize, this.textColor,required this.text, required this.onTap, required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom
      (primary: backgroundColor),
      onPressed: onTap,
      child: Text(text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}


