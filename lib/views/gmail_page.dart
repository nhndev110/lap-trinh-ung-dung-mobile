import 'package:flutter/material.dart';

class GmailPage extends StatefulWidget {
  GmailPage({super.key});

  @override
  State<GmailPage> createState() => _GmailPageState();
}

class _GmailPageState extends State<GmailPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopNavigation(),
      drawer: MyDrawer(),
      body: Container(
        padding: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            ButtonAction(),
            // Expanded(child: MyPageView()),
            // Indicator(5, currentPage),
            SizedBox(height: 20)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget MyDrawer() {
    return Container(
      child: Drawer(
        backgroundColor: Colors.white,
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

  AppBar TopNavigation() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          );
        },
      ),
      title: Text(
        "Họp mặt",
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            backgroundImage: AssetImage("images/avatar/no-avatar.webp"),
            radius: 16,
          ),
        ),
      ],
    );
  }

  Widget BottomNavigation() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 20,
      currentIndex: 2,
      selectedItemColor: Colors.red,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.mail_outline,
          ),
          label: 'Email',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat_bubble_outline,
          ),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.video_call,
          ),
          label: 'Meeting',
        ),
      ],
    );
  }

  Widget ButtonAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[700],
            padding: EdgeInsets.symmetric(
              horizontal: 66,
              vertical: 20,
            ),
          ),
          child: Text(
            "Cuộc họp mới",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text(
            "Tham gia cuộc họp",
            style: TextStyle(
              color: Colors.blue[700],
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 66,
              vertical: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget MyPageView() {
    return PageView(
      onPageChanged: (value) {
        setState(() {
          currentPage = value;
        });
      },
      children: List.generate(
        5,
        (index) => CarouselItem(),
      ),
    );
  }

  Widget CarouselItem() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/meet/meet.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 12),
            child: Text(
              "Cuộc họp luôn an toàn",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 12, right: 8, left: 8),
            child: Text(
              "Không ai bên ngoài tổ chức của bạn có thể tham gia cuộc họp khi người tổ chức chưa mời hoặc chưa cho phép",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget Indicator(int length, int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Container(
          height: 10,
          width: 10,
          margin: EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
            color: (index == currentPage) ? Colors.blue : Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
