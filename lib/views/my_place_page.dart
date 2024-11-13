import 'package:flutter/material.dart';

class MyPlace extends StatefulWidget {
  const MyPlace({super.key});

  @override
  State<MyPlace> createState() => _MyPlaceState();
}

class _MyPlaceState extends State<MyPlace> {
  bool isLiked = true;
  int countLike = 41;

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(children: [
            Banner(),
            Header(),
            ListButton(),
            Description()
          ]),
        ),
      );

  Widget Banner() => Container(
        height: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "images/Camping-tents-Switzerland.jpg"),
                fit: BoxFit.cover)),
      );

  Widget Header() => Container(
        padding: EdgeInsets.all(32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Oeschinen Lake Campground",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Text(
                  "Kandersteg, Switzerland",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (isLiked) {
                        countLike--;
                      } else {
                        countLike++;
                      }
                      isLiked = !isLiked;
                    });
                  },
                  child: isLiked
                      ? Icon(Icons.star, color: Colors.yellow[800])
                      : Icon(Icons.star_border_outlined,
                          color: Colors.black54),
                ),
                Container(
                    margin: EdgeInsets.only(left: 2),
                    child: Text("${countLike}")),
              ],
            )
          ],
        ),
      );

  Widget ListButton() => Container(
        padding: EdgeInsets.only(right: 32, left: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonActivity(Icons.phone, Colors.blue, "CALL"),
            ButtonActivity(Icons.route, Colors.blue, "ROUTE"),
            ButtonActivity(Icons.share, Colors.blue, "SHARE"),
          ],
        ),
      );

  Widget ButtonActivity(IconData icon, Color color, String str) =>
      Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Text(
            str,
            style: TextStyle(color: color),
          )
        ],
      );

  Widget Description() => Container(
        padding: EdgeInsets.all(32),
        child: Text(
            "Oeschinen Lake Campground is a scenic destination located near the pristine Oeschinen Lake in the Swiss Alps. Nestled amidst towering mountains and lush forests, it offers a perfect blend of adventure and tranquility for nature lovers and outdoor enthusiasts. The campground provides easy access to hiking trails, fishing spots, and breathtaking viewpoints overlooking the turquoise waters of the lake. Visitors can enjoy a serene camping experience while immersing themselves in the beauty of the surrounding alpine landscape, making it an ideal spot for relaxation, exploration, and reconnecting with nature."),
      );
}
