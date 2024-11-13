import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  final String avt =
      "https://jobtest.vn/hrblog/wp-content/uploads/2022/12/diem-chuan-dai-hoc-khoa-hoc-hue-1.jpg";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Scaffold(
        body: ListView(
          children: [
            flag(),
            sayHello("Xin chào ĐHKH", Colors.red, Colors.yellow),
            flashCard(avt, "Xin chào ĐHKH"),
            flag(),
            sayHello("Xin chào Việt Nam", Colors.blue, Colors.white),
            flag(),
          ],
        ),
      ),
    );
  }

  Widget flashCard(String bgURL, String str) {
    return Container(
      height: 300,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            opacity: 0.6,
            fit: BoxFit.cover,
            image: NetworkImage(bgURL),
          ),
          color: const Color.fromARGB(255, 61, 89, 112)),
      child: Center(
        child: Text(
          str,
          style: const TextStyle(
              shadows: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    blurRadius: 5)
              ],
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget sayHello(String str, Color bg, Color fg) {
    return Container(
        height: 300,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(6, 6))
        ], borderRadius: BorderRadius.circular(30), color: bg),
        child: Center(
            child: Text(
          str,
          style: TextStyle(fontSize: 26, color: fg),
        )));
  }

  Widget flag() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 300,
      height: 250,
      decoration: const BoxDecoration(color: Colors.red),
      child: const Center(
        child: Icon(Icons.star, color: Colors.yellow, size: 150),
      ),
    );
  }
}
