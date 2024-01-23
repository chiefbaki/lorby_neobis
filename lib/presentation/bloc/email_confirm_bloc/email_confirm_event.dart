abstract class EmailConfirmEvent{}

class MakeEmailConfirm extends EmailConfirmEvent{
  final String confirmationCode;
  MakeEmailConfirm({required this.confirmationCode});
}