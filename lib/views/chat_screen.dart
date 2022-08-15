import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Models/message_data.dart';
import 'package:flutter_chat_app/widgets/demo_messageList.dart';
import 'package:flutter_chat_app/widgets/icon_background.dart';
import '../widgets/app_title.dart';
import '../widgets/message_inputbox.dart';

class ChatScreen  extends StatelessWidget {
  static Route route(MessageData data)=> MaterialPageRoute(
      builder: (context)=>ChatScreen(messageData: data));

  final MessageData messageData;
  const ChatScreen({Key? key,
    required this.messageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
              icon: CupertinoIcons.back,
              onTap: (){
                Navigator.of(context).pop();
              },
          ),
        ),
        title: AppTitle(
          messageData: messageData,
        ) ,
        actions: <Widget>[
          IconBackground(
              icon: CupertinoIcons.camera_fill,
              onTap: (){},
          ),
          IconBackground(
            icon: CupertinoIcons.phone,
            onTap: () {  },
          ),
        ],
      ),
      body: Column(
        children: const [
          Expanded(
              child: DemoMessageList()
          ),
          MessageInputBox(),
        ],
      ),
    );
  }
}
