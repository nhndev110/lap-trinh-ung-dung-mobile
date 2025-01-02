import 'package:flutter/material.dart';
import 'package:test1/models/my_product.dart';
import 'package:test1/utils/api_service.dart';

class MyShop extends StatefulWidget {
  const MyShop({super.key});

  @override
  State<MyShop> createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
  late Future<List<MyProduct>> lsMyProduct;

  @override
  void initState() {
    super.initState();
    lsMyProduct = ApiService.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: FutureBuilder<List<MyProduct>>(
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

  Widget myListView(List<MyProduct> ls) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: ls.map((e) => myItem(e)).toList(),
      ),
    );
  }

  Widget myItem(MyProduct p) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(p.image),
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Badge(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  label: Text(
                    p.category,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 45,
                  child: Text(
                    p.title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "${p.price}\$",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                          size: 18,
                        ),
                        SizedBox(width: 2),
                        Text(
                          "${p.rating.rate}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    Text(
                      " | ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${p.rating.count} đánh giá",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
