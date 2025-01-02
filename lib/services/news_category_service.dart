import 'package:test1/models/news_category_model.dart';

class NewsCategoryService {
  static List categories = [
    NewsCategoryModel(
      bgURL: "images/news/category_bg_1.jpg",
      categoryName: "Business",
    ),
    NewsCategoryModel(
      bgURL: "images/news/category_bg_2.jpg",
      categoryName: "Entertainment",
    ),
    NewsCategoryModel(
      bgURL: "images/news/category_bg_3.jpg",
      categoryName: "Technology",
    ),
  ];
}
