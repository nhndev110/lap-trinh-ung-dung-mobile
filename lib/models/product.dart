class Product {
  late int id;
  late String name;
  late String unit;
  late double price;
  late String thumbnail;

  Product({
    required this.id,
    required this.name,
    required this.unit,
    required this.price,
    this.thumbnail = "",
  });
}
