import 'package:lorby_neobis/data/model/success_register_message.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final SuccessRegisterMessageModel message;
  RegisterSuccess({required this.message});
}

class RegisterError extends RegisterState {
  final String error;
  RegisterError({required this.error});
}
