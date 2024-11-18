import 'package:flutter/material.dart';
import 'package:test1/views/gmail_page.dart';
import 'package:test1/views/my_shop.dart';
import 'package:test1/views/shop_page.dart';
import 'package:test1/views/cart_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: "NHN Shop",
      initialRoute: "/gmail",
      routes: {
        '/': (context) => ShopPage(),
        '/cart': (context) => CartPage(),
        '/gmail': (context) => GmailPage(),
        '/shop': (context) => MyShop(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

void main(List<String> args) => runApp(App());
