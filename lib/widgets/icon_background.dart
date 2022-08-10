import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/utils/colors/colors.dart';

class IconBackground extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const IconBackground({Key? key,
    required this.icon,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          splashColor: AppColors.secondary,
          onTap:onTap,
          child:  Padding(
              padding: const EdgeInsets.all(6),
            child: Icon(
              icon,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
