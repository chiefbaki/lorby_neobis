import 'package:dio/dio.dart';
import 'package:lorby_neobis/data/model/email_confirm_model.dart';
import 'package:lorby_neobis/data/model/login_model.dart';
import 'package:lorby_neobis/data/model/register_model.dart';
import 'package:lorby_neobis/data/network/dio_settings.dart';

class RegisterRepository {
  final Dio _dio = DioSettings().dio;
  Future<void> postRegisterModel(String email, String username, String password,
      String passwordConfirm) async {
    await _dio.post("https://neobook.online/lorby/authentication/register/",
        data: RegisterModel(
                email: email,
                username: username,
                password: password,
                passwordConfirm: passwordConfirm)
            .toJson());
  }

  Future<void> postEmailConfirm(String code) async {
    await _dio.post(
        "https://neobook.online/lorby/authentication/email-confirm/",
        data: EmailConfirm(code: code).toJson());
  }

  Future<void> postLogin(String username, String password) async {
    await _dio.post("https://neobook.online/lorby/authentication/login/",
        data: LoginModel(username: username, password: password).toJson());
  }
}