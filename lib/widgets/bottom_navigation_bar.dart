import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/utils/colors/colors.dart';
import 'package:flutter_chat_app/widgets/glowing_action_button.dart';

import 'navigation_bar_item.dart';

class BottomNavigatorBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;
  const BottomNavigatorBar({Key? key,
    required this.onItemSelected}) : super(key: key);

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  var selectedIndex = 0;
  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
      widget.onItemSelected(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final brightness = Theme.of(context).brightness;
    return Container(
      height: h * 0.12 ,
      color: (brightness == Brightness.light) ? AppColors.textFaded : AppColors.textDark,
      child:   SafeArea(
        top: false,
        bottom: true,
        child: SizedBox(
          width: w * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              NavigationBarItem(onTap:handleItemSelected,label:'Messaging', index:0, icon: Icons.message,isSelected:(selectedIndex == 0)),
              NavigationBarItem(onTap:handleItemSelected,label:'Notifications', index:1, icon: CupertinoIcons.bell_fill,isSelected: (selectedIndex == 1)),
              const SizedBox(width:4),
              GlowingActionButton(color: AppColors.secondary, icon: CupertinoIcons.add, onPressed: (){}),
              NavigationBarItem(onTap:handleItemSelected,label:'Calls', index:2, icon: Icons.call,isSelected: (selectedIndex == 2)),
              NavigationBarItem(onTap:handleItemSelected,label:'Contacts', index:3, icon: Icons.contacts,isSelected: (selectedIndex == 3)),
            ],
          ),
        ),
      ),
    );
  }
}
