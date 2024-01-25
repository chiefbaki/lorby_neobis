import 'package:lorby_neobis/data/model/success_confirm_email.dart';

abstract class EmailConfirmState {}

class EmailConfirmInitial extends EmailConfirmState {}

class EmailConfirmSuccess extends EmailConfirmState {
  final SuccessConfirmMessageModel message;
  EmailConfirmSuccess({required this.message});
}

class EmailConfirmError extends EmailConfirmState {
  final String error;
  EmailConfirmError({required this.error});
}
