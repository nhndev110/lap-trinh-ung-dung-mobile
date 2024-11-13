import 'package:flutter/material.dart';
import 'package:test1/models/myproduct.dart';
import 'package:test1/utils/api_service.dart';

class MyShop extends StatefulWidget {
  const MyShop({super.key});

  @override
  State<MyShop> createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
  late Future<List<Myproduct>> lsMyProduct;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lsMyProduct = ApiService.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Myproduct>>(
        future: lsMyProduct,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data!;
            return myListView(data);
          }
        },
      ),
    );
  }

  Widget myListView(List<Myproduct> ls) {
    return ListView(
      children: ls.map((e) => myItem(e)).toList(),
    );
  }

  Widget myItem(Myproduct p) {
    return Text(p.title);
  }
}
