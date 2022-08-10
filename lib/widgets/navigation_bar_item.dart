import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/utils/colors/colors.dart';

class NavigationBarItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final int index;
  final IconData icon;
  final ValueChanged<int> onTap;
  const NavigationBarItem({Key? key,
    required this.label,
    this.isSelected = false,
    required this.index,
    required this.icon,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon,
            color: isSelected ? AppColors.secondary : null,
            ),
            Text(label,
            style: isSelected? const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary): const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
