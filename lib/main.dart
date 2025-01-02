import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/providers/news_provider.dart';
import 'package:test1/views/gmail_page.dart';
import 'package:test1/views/login_page.dart';
import 'package:test1/views/my_shop.dart';
import 'package:test1/views/news_page.dart';
import 'package:test1/views/profile_page.dart';
import 'package:test1/views/shop_page.dart';
import 'package:test1/views/cart_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsProvider()),
      ],
      child: MaterialApp(
        color: Colors.white,
        title: 'SV21T1020547',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        initialRoute: '/news',
        routes: {
          '/': (context) => LoginPage(),
          '/cart': (context) => CartPage(),
          '/gmail': (context) => GmailPage(),
          '/shop': (context) => ShopPage(),
          '/my-shop': (context) => MyShop(),
          '/login': (context) => LoginPage(),
          '/profile': (context) => ProfilePage(),
          '/news': (context) => NewsPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

void main(List<String> args) => runApp(App());
