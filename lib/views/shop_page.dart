import 'package:flutter/material.dart';
import 'package:test1/models/product.dart';
import 'package:test1/services/cart_service.dart';
import 'package:test1/services/shop_service.dart';
import 'package:test1/views/cart_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int cartItemCount = CartService.getCount();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        title: Text(
          "SHOP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () async {
                    // Navigator.pushNamed(context, '/cart');
                    int cartItemCount = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                    setState(() {
                      this.cartItemCount = cartItemCount;
                    });
                  },
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.white,
                  tooltip: "Cart",
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 15,
                    padding: EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "${cartItemCount}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          ...ShopService.productList
              .map((product) => ProductCard(product))
              .toList()
        ],
      ),
    );
  }

  Widget ProductCard(Product product) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(product.thumbnail),
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemText("Name", product.name),
            ItemText("Unit", product.unit),
            ItemText("Price", "\$${product.price}")
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            setState(() {
              ShopService.addToCart(product);
              this.cartItemCount = CartService.getCount();
            });
            var snackBar = SnackBar(content: Text("Added product to cart"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text("Add to Cart"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Text ItemText(String label, String value) {
    return Text.rich(
      TextSpan(
        text: "${label}: ",
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
