import 'package:flutter/material.dart';
import 'package:test1/models/carousel_data.dart';
import 'package:test1/services/meet_service.dart';

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
      appBar: TopNavigation(context),
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
    );
  }

  AppBar TopNavigation(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
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
        MeetService.carousel.length,
        (index) => CarouselItem(MeetService.carousel.elementAt(index)),
      ),
    );
  }

  Widget CarouselItem(CarouselData carouselData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(carouselData.bgUrl),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 12),
          child: Text(
            carouselData.title,
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
            carouselData.description,
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
