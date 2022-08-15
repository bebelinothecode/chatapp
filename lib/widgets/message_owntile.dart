import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageOwnTile extends StatelessWidget {
  final String message;
  final String messageDate;
  static const borderRadius = 26.0;
  const MessageOwnTile({Key? key,
    required this.message,
    required this.messageDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
      child: Align(
        alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
              child: Text(message),
            ),
          ),
          Padding(padding: const EdgeInsets.only(top: 8.0),
          child: Text(messageDate,
          style: const TextStyle(fontSize: 10),
             ),
           ),
         ],
       ),
      ),
    );
  }
}
