import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors/colors.dart';

class GlowingActionButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final double size;
  final VoidCallback onPressed;
  const GlowingActionButton({Key? key,
    required this.color,
    required this.icon,
    this.size = 54,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 24,
          ),
        ]
      ),
      child: ClipOval(
        child: Material(
          color: color,
          child: InkWell(
            splashColor: AppColors.cardLight,
            onTap: onPressed,
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
