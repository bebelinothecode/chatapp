import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors/colors.dart';

class IconBorder extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const IconBorder({Key? key,
    required this.icon,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      splashColor: AppColors.secondary,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 2,
            color: Theme.of(context).cardColor,
          ),
        ),
        child: const Padding(
            padding: EdgeInsets.all(5),
        ),
      ),
    );
  }
}
