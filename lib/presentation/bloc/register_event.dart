abstract class RegisterEvent {}

class UserRegisterEvent extends RegisterEvent {
  final String email;
  final String login;
  final String password;
  final String passwordConfirm;
  UserRegisterEvent(
      {required this.email,
      required this.login,
      required this.password,
      required this.passwordConfirm});
}
