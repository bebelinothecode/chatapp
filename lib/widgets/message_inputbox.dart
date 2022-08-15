import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors/colors.dart';
import 'glowing_action_button.dart';

class MessageInputBox extends StatelessWidget {
  const MessageInputBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(CupertinoIcons.camera_fill),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: "Type something",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 12,right: 24),
              child: GlowingActionButton(
                icon: Icons.send_rounded,
                onPressed: () {  },
                color: AppColors.accent,
              ),
            )
          ],
        ),
    );
  }
}
