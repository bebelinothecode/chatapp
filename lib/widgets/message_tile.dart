import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Models/message_data.dart';
import 'package:flutter_chat_app/utils/colors/colors.dart';
import 'package:flutter_chat_app/views/chat_screen.dart';

import 'avatar.dart';

class MessageTile extends  StatelessWidget {
  final MessageData messageData;
  const MessageTile({Key? key,
    required this.messageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(ChatScreen.route(messageData));
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.textDark,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Avatar.medium(url: messageData.profilePicture),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(messageData.senderName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                  ),
                    ),
                    SizedBox(
                      height: 20,
                      child: Text(messageData.message,
                      style: const TextStyle(
                        color: AppColors.textFaded,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                       ),
                      ),
                    ),
                  ],
                ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const SizedBox(height: 4),
                    Text(messageData.dateMessage.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textFaded,
                    ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 20,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                      child:  const Center(
                        child: Text('1',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
