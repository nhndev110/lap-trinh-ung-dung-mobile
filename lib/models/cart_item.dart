import 'package:test1/models/product.dart';

class CartItem {
  late Product product;
  late int quantity;

  CartItem({required this.product, this.quantity = 1});
}
