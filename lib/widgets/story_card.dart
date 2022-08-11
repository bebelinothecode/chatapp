import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/Models/story_data.dart';
import 'package:flutter_chat_app/widgets/avatar.dart';

class StoryCard extends StatelessWidget {
  final StoryData storyData;

  const StoryCard({Key? key, 
    required this.storyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Avatar.medium(url: storyData.url),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
