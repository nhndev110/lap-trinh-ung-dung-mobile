import 'package:flutter/material.dart';
import 'package:test1/screens/chat_screen.dart';
import 'package:test1/screens/gmail_screen.dart';
import 'package:test1/screens/meet_screen.dart';

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

  Widget GmailDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              child: Row(
                children: [
                  Image(
                    image: AssetImage("images/gmail/gmail_icon.png"),
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Gmail",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text("Tất cả hộp thư đến"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.mark_email_unread_outlined),
            title: Text("Chính"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people_outline),
            title: Text("Mạng xã hội"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.label_outline),
            title: Text("Quảng cáo"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.error_outline),
            title: Text("Nội dung cập nhật"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.forum_outlined),
            title: Text("Diễn đàn"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
