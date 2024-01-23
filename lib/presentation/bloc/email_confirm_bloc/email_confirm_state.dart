abstract class EmailConfirmState {}

class EmailConfirmInitial extends EmailConfirmState {}

class EmailConfirmSuccess extends EmailConfirmState {
  final dynamic code;
  EmailConfirmSuccess({required this.code});
}

class EmailConfirmError extends EmailConfirmState {
  final String error;
  EmailConfirmError({required this.error});
}
