import 'package:flutter/material.dart';

class GmailDrawer extends StatelessWidget {
  const GmailDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
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
      ),
    );
  }
}
