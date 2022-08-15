import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/Models/message_data.dart';
import 'package:flutter_chat_app/widgets/avatar.dart';
import '../utils/colors/colors.dart';

class AppTitle extends StatelessWidget {
  final MessageData messageData;
  const AppTitle({Key? key,
     required this.messageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Avatar.small(
          url: messageData.profilePicture,
        ),
        const SizedBox(width: 16),
        Expanded(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text(messageData.senderName,
                 overflow: TextOverflow.ellipsis,
                 style: const TextStyle(fontSize: 14),
                 ),
                 const SizedBox(height: 2),
                 const Text('Online now',
                 style: TextStyle(
                   color: AppColors.greenColor,
                   fontSize: 10,
                   fontWeight: FontWeight.bold,
                   ),
                 ),
               ],
             ),
        ),
      ],
    );
  }
}
