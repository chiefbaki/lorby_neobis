abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final dynamic result;
  RegisterSuccess({required this. result});  
}

class RegisterError extends RegisterState {
  final String error;
  RegisterError({required this.error});
}
