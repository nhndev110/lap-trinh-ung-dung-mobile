import 'package:dio/dio.dart';
import 'package:test1/models/my_product.dart';

class ApiService {
  static Future<List<MyProduct>> getAllProduct() async {
    var dio = Dio();
    var response = await dio.request(
      'https://fakestoreapi.com/products',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> rs = response.data;
      return rs.map((e) => MyProduct.fromJson(e)).toList();
    } else {
      print(response.statusMessage);
      throw Exception(response.statusMessage);
    }
  }
}
