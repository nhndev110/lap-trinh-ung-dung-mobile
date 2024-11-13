import 'package:dio/dio.dart';
import 'package:test1/models/myproduct.dart';

class ApiService {
  static Future<List<Myproduct>> getAllProduct() async {
    var dio = Dio();
    var response = await dio.request(
      'https://fakestoreapi.com/products',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> rs = response.data;
      return rs.map((e) => Myproduct.fromJson(e)).toList();
    } else {
      print(response.statusMessage);
      throw Exception(response.statusMessage);
    }
  }
}
