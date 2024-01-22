import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lorby_neobis/data/model/register_model.dart';
import 'package:lorby_neobis/data/network/dio_settings.dart';

class RegisterRepository {
  final Dio dio = DioSettings().dio;
  Future<void> postRegisterModel(String email, String username, String password, String passwordConfirm) async {
    try {
      await dio.post("https://neobook.online/lorby/authentication/register/",
          data: RegisterModel(
                  email: email,
                  username: username,
                  password: password,
                  passwordConfirm: passwordConfirm)
              .toJson());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
