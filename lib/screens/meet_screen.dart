import 'package:flutter/material.dart';
import 'package:test1/widgets/gmail_drawer.dart';

class MeetScreen extends StatefulWidget {
  @override
  State<MeetScreen> createState() => _MeetScreenState();
}

class _MeetScreenState extends State<MeetScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopNavigation(),
      drawer: GmailDrawer(),
      body: Container(
        padding: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            ButtonAction(),
            Expanded(child: MyPageView()),
            Indicator(5, currentPage),
            SizedBox(height: 20)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.white,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                child: Center(
                  child: Text("This is a modal"),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.blue[50],
        child: Icon(Icons.video_call_outlined),
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
            child: Image(
              image: AssetImage("images/avatar/no-avatar.png"),
              height: 28,
            ),
            backgroundColor: Colors.white,
            radius: 18,
          ),
        )
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
    return Column(
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
