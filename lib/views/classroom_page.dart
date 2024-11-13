import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test1/models/classroom_data.dart';

class Classroom extends StatelessWidget {
  Classroom({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        shadowColor: Colors.grey,
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 100, 100, 100),
      )),
      title: "Classroom",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading:
              IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("images/10th_anniversary.png"),
                fit: BoxFit.contain,
                height: 42,
              ),
              Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Text.rich(TextSpan(
                      text: "Google ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: "Classroom",
                            style: TextStyle(
                                fontWeight: FontWeight.normal))
                      ])))
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image(
                  image: AssetImage("images/no-avatar.webp"),
                  height: 24,
                  fit: BoxFit.contain,
                )),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          children: [
            weeklyTaskList(),
            ...listClassroom.map((room) => card(room)).toList(),
          ],
        ),
        floatingActionButton: btnNew(),
      ));

  Widget btnNew() => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black87,
                  offset: Offset(0, 0),
                  blurRadius: 72)
            ]),
        width: 50,
        height: 50,
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.blue,
            )),
      );

  Widget weeklyTaskList() => Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(24),
        height: 180,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 212, 212, 212)),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tuần này",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Xem danh sách việc cần làm",
                    style:
                        TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text("Hiện không có bài tập nào",
                    style: TextStyle(color: Colors.grey))
              ],
            )
          ],
        ),
      );

  Color getRandomColor() {
    Random random = new Random();
    return Color.fromARGB(255, random.nextInt(255),
        random.nextInt(255), random.nextInt(255));
  }

  Widget card(ClassroomData room) => Container(
        height: 180,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: (room.bgURL == "") ? getRandomColor() : null,
            image: (room.bgURL != "")
                ? DecorationImage(
                    image: AssetImage(room.bgURL), fit: BoxFit.cover)
                : null,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                text:
                                    "[${room.semester}] ${room.subject}",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500))),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: IconButton(
                          icon: Icon(Icons.more_horiz),
                          color: Colors.white,
                          iconSize: 24,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Text(
                        room.id,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    "${room.totalStudent} học viên",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
