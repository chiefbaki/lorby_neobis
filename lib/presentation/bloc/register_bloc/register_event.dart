abstract class RegisterEvent {}

class UserRegisterEvent extends RegisterEvent {
  final String email;
  final String username;
  final String password;
  final String passwordConfirm;
  UserRegisterEvent(
      {required this.email,
      required this.username,
      required this.password,
      required this.passwordConfirm});
}
