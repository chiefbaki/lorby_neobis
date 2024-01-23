abstract class LoginEvent{}

class MakeLoginEvent extends LoginEvent{
  final String username;
  final String password;
  MakeLoginEvent({required this.username, required this.password});
}