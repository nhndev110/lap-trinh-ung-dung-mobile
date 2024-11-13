class Myproduct {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  late Rating rating;

  Myproduct({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    // required this.rating,
  });

  factory Myproduct.fromJson(Map<String, dynamic> json) {
    return Myproduct(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }

  // static Myproduct fromJson(Map<String, dynamic> json) {
  // }
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });
}
