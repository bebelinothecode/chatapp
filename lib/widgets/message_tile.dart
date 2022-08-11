import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/Models/message_data.dart';

import 'avatar.dart';

class MessageTile extends  StatelessWidget {
  final MessageData messageData;
  const MessageTile({Key? key,
    required this.messageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Avatar.medium(url: ,)
      ],
    );
  }
}
