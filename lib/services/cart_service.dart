import 'package:test1/models/cart_item.dart';

class CartService {
  static late List<CartItem> cart = [];

  static int getCount() => cart.length;

  static void add(CartItem cartItem, {int quantity = 1}) {
    cartItem.quantity += quantity;
  }

  static void remove(CartItem cartItem, {int quantity = 1}) {
    if (cartItem.quantity > 1) {
      cartItem.quantity -= quantity;
    }
  }

  static void delete(int id) {
    cart.removeWhere((cartItem) => cartItem.product.id == id);
  }

  static double getTotal() {
    return cart.fold(
      0,
      (total, item) => total + (item.product.price * item.quantity),
    );
  }
}
