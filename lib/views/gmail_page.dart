import 'package:flutter/material.dart';
import 'package:test1/screens/chat_screen.dart';
import 'package:test1/screens/gmail_screen.dart';
import 'package:test1/screens/meet_screen.dart';
import 'package:test1/widgets/gmail_drawer.dart';

class GmailPage extends StatefulWidget {
  GmailPage({super.key});

  @override
  State<GmailPage> createState() => _GmailPageState();
}

class _GmailPageState extends State<GmailPage> {
  int currentPage = 0;
  int _bottomNavIndex = 0;

  static List<Widget> _widgetOption = <Widget>[
    GmailScreen(),
    ChatScreen(),
    MeetScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: GmailDrawer(),
      body: _widgetOption.elementAt(_bottomNavIndex),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget BottomNavigation() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 20,
      currentIndex: _bottomNavIndex,
      selectedItemColor: Colors.red,
      onTap: (int index) {
        setState(() {
          _bottomNavIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.mail),
          icon: Icon(
            Icons.mail_outline,
          ),
          label: 'Email',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.chat_bubble),
          icon: Icon(
            Icons.chat_bubble_outline,
          ),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.videocam),
          icon: Icon(
            Icons.videocam_outlined,
          ),
          label: 'Meeting',
        ),
      ],
    );
  }
}
