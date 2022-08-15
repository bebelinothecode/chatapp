import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/widgets/date_label.dart';
import 'package:flutter_chat_app/widgets/message_owntile.dart';
import 'package:flutter_chat_app/widgets/messagetileChat.dart';
import 'package:jiffy/jiffy.dart';

class DemoMessageList extends StatelessWidget {
  const DemoMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  <Widget>[
        const DateLabel(label: "Yesterday"),
        MessageOwnTile(
            message: "Bebelino is a very good rich man",
            messageDate: Jiffy().format("MMM do yy"),
        ),
        MessageOwn(message: "So what fjbvfubvjvifjbvfjobnvfjnvjofnj?", messageDate: Jiffy().format("MMM do yy")),
      ],
    );
  }
}
