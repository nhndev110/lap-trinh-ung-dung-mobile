import 'package:test1/models/user_data.dart';
import 'package:dio/dio.dart';

class AuthService {
  static UserData? userData;

  static Future<UserData> login(String username, String password) async {
    var dio = new Dio();
    var resp = await dio.request(
      'https://dummyjson.com/auth/login',
      options: Options(
        method: 'POST',
      ),
      data: {
        'username': username,
        'password': password,
      },
    );

    if (resp.statusCode == 200) {
      dynamic rs = resp.data;
      return UserData.fromJson(rs);
    } else {
      throw Exception(resp.data.message);
    }
  }
}
