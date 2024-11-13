import 'package:flutter/material.dart';
import 'package:test1/models/cart_item.dart';
import 'package:test1/services/cart_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, CartService.getCount());
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          "CART (${CartService.getCount()})",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "Edit",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          CartService.cart.length > 0 ? listItemCard() : emptyCart(),
          Container(
            height: 100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub-Total"),
                      Text(
                        "\$${CartService.getTotal()}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Center(
                        child: Text(
                          "Proceed to Pay",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget emptyCart() {
    return Expanded(
      child: Center(
        child: Text(
          "Your cart is Empty",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Expanded listItemCard() {
    return Expanded(
      child: ListView(
        children: [
          ...CartService.cart.map((cardItem) => CardItem(cardItem)).toList()
        ],
      ),
    );
  }

  Padding shoppingButton() {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            tooltip: "Cart",
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "${CartService.getCount()}",
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
    );
  }

  Widget CardItem(CartItem cartItem) {
    return Card(
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(cartItem.product.thumbnail),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemText("Name", cartItem.product.name),
                ItemText("Unit", cartItem.product.unit),
                ItemText("Price", "${cartItem.product.price}"),
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          CartService.remove(cartItem);
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(cartItem.quantity.toString()),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          CartService.add(cartItem);
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      CartService.delete(cartItem.product.id);
                    });
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
              ],
            )
          ],
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
