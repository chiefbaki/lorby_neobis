import 'package:lorby_neobis/data/model/token_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final TokenModel token;
  LoginSuccess({required this.token});
}

class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}
