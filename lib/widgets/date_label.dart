import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateLabel extends StatelessWidget {
  final String label;
  const DateLabel({Key? key,
    required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 12),
            child: Text(
              label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
      ),
    );
  }
}
