import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Models/story_data.dart';
import 'package:flutter_chat_app/utils/helpers.dart';
import 'package:flutter_chat_app/widgets/story_card.dart';
import '../utils/colors/colors.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(
          children:  <Widget>[
            const Text("Stories",
              style:TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: AppColors.textFaded,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StoryCard(
                          storyData: StoryData(
                              name: faker.person.name(),
                              url: Helpers.randomPictureUrl(),
                  ),
                ),
                    );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
