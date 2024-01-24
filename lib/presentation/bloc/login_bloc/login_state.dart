abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final dynamic token;
  LoginSuccess({required this.token});
}

class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}
