import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test1/models/news_model.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> list = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final String API_KEY = "11169394ea3349bebe6d877149534b8d";
  final int PAGE = 1;
  final int PAGE_SIZE = 20;
  final String COUNTRY = "us";

  void getList({String category = "General"}) async {
    String apiURL =
        "https://newsapi.org/v2/top-headlines?country=${COUNTRY}&pageSize=${PAGE_SIZE}&page=${PAGE}&category=${category}&apiKey=${API_KEY}";
    var dio = Dio();
    try {
      _isLoading = true;
      notifyListeners();
      var resp = await dio.request(apiURL, options: Options(method: "GET"));
      if (resp.statusCode == 200) {
        List<dynamic> rs = resp.data['articles'] as List;
        list = rs.map((el) => NewsModel.fromJson(el)).toList();
      } else {
        throw Exception("Failed to load news");
      }
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
