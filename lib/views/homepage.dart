import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/utils/colors/colors.dart';
import 'package:flutter_chat_app/utils/helpers.dart';
import 'package:flutter_chat_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter_chat_app/widgets/icon_background.dart';
import '../widgets/avatar.dart';
import 'calls_page.dart';
import 'contacts_page.dart';
import 'messages_page.dart';
import 'notifications_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier("Messages");

  final pages = [
     const Messages(),
    const Notifications(),
    const CallsPage(),
    const Contacts(),
  ];

  final pageTitles = [
    "Messages",
    "Notifications",
    "Calls",
    "Contacts",
  ];

  void _onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigatorBar(
          onItemSelected: _onNavigationItemSelected,
      ),
      appBar: AppBar(
        leading: IconBackground(
            icon: Icons.search,
            onTap: (){},
      ),
        actions:   const [
          Padding(
            padding: EdgeInsets.only(left: 0,top: 3,right: 1),
            child: Hero(
              tag: "hero-profile-picture",
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Avatar.small(),
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: ValueListenableBuilder(
            valueListenable: title,
            builder: (BuildContext context,String value,_) {
              return Text(
                value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            );
          }
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (context, int value,_) {
            return pages[value];
          })
    );
  }
}
