import 'package:test1/models/cart_item.dart';
import 'package:test1/models/product.dart';
import 'package:test1/services/cart_service.dart';

class ShopService {
  static late List<Product> productList = [
    Product(
      id: 1,
      name: "Mango",
      unit: "Kg",
      price: 20,
      thumbnail: "images/products/mango.png",
    ),
    Product(
      id: 2,
      name: "Apple",
      unit: "Kg",
      price: 15,
      thumbnail: "images/products/apple.png",
    ),
    Product(
      id: 3,
      name: "Watermelon",
      unit: "Kg",
      price: 19,
      thumbnail: "images/products/watermelon.png",
    ),
    Product(
      id: 4,
      name: "Lemon",
      unit: "Kg",
      price: 30,
      thumbnail: "images/products/lemon.png",
    ),
    Product(
      id: 5,
      name: "Orange",
      unit: "Kg",
      price: 25,
      thumbnail: "images/products/orange.png",
    ),
    Product(
      id: 6,
      name: "Banana",
      unit: "Kg",
      price: 28,
      thumbnail: "images/products/banana.png",
    )
  ];

  static void addToCart(Product product) {
    List<CartItem> cart = CartService.cart;
    bool isProductInCart = cart.any((cartItem) => cartItem.product == product);
    if (isProductInCart) {
      CartService.cart.forEach((cartItem) {
        if (cartItem.product == product) {
          cartItem.quantity++;
        }
      });
    } else {
      CartService.cart.add(CartItem(product: product));
    }
  }
}
