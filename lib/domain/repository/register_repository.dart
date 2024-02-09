import 'package:dio/dio.dart';
import 'package:lorby_neobis/core/consts/consts.dart';
import 'package:lorby_neobis/data/model/email_confirm_model.dart';
import 'package:lorby_neobis/data/model/login_model.dart';
import 'package:lorby_neobis/data/model/register_model.dart';
import 'package:lorby_neobis/data/model/success_confirm_email.dart';
import 'package:lorby_neobis/data/model/success_register_message.dart';
import 'package:lorby_neobis/data/model/token_model.dart';
import 'package:lorby_neobis/data/network/dio_settings.dart';
import 'package:lorby_neobis/data/model/refresh_token_model.dart';


class RegisterRepository {
  final Dio _dio = DioSettings().dio;
  Future<SuccessRegisterMessageModel> postRegisterModel(String email, String username,
      String password, String passwordConfirm) async {
    final Response response = await _dio.post(AppConsts.registerConst,
        data: RegisterModel(
                email: email,
                username: username,
                password: password,
                passwordConfirm: passwordConfirm)
            .toJson());
    return SuccessRegisterMessageModel.fromJson(response.data);
  }

  Future<SuccessConfirmMessageModel> postEmailConfirm(String code) async {
    Response response = await _dio.post(AppConsts.emailConfirmConst,
        data: EmailConfirm(code: code).toJson());
        return SuccessConfirmMessageModel.fromJson(response.data);
  }

  Future<TokenModel> postLogin(String username, String password) async {
    final Response response = await _dio.post(AppConsts.loginConst,
        data: LoginModel(username: username, password: password).toJson());

    return TokenModel.fromJson(response.data);
  }

  Future<RefreshTokenModel> postRefreshToken(String token) async {
    final Response response = await _dio.post(AppConsts.refreshTokenConst,
        data: TokenModel(access: token).toJson());
    return RefreshTokenModel(tokenRefresh: response.data);
  }
}
