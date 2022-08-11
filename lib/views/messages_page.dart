import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Models/message_data.dart';
import 'package:flutter_chat_app/utils/helpers.dart';
import 'package:flutter_chat_app/views/stories.dart';
import 'package:flutter_chat_app/widgets/message_tile.dart';
import 'package:jiffy/jiffy.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: <Widget>[
        const SliverToBoxAdapter(
            child: Stories(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(_delegate),
        ),
      ],
    );
  }
  Widget _delegate (BuildContext context, int index) {
    final Faker faker = Faker();
    final date = Helpers.randomDate();
    return MessageTile(
        messageData: MessageData(
            senderName: faker.person.name(),
            message: faker.lorem.sentence(),
            messageDate: date,
            dateMessage: Jiffy(date).fromNow(),
            profilePicture: Helpers.randomPictureUrl(),
        ),
    );
  }
}
