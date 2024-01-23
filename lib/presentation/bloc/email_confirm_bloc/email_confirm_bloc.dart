import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/email_confirm_bloc/email_confirm_event.dart';
import 'package:lorby_neobis/presentation/bloc/email_confirm_bloc/email_confirm_state.dart';
import 'package:lorby_neobis/repository/register_repository.dart';

class EmailConfirmBloc extends Bloc<EmailConfirmEvent, EmailConfirmState> {
  EmailConfirmBloc({required this.repository}) : super(EmailConfirmInitial()) {
    on<MakeEmailConfirm>((event, emit) {
      try {
        var result = repository.postEmailConfirm(event.confirmationCode);
        emit(EmailConfirmSuccess(code: result));
      } catch (e) {
        emit(EmailConfirmError(error: e.toString()));
      }
    });
  }
  final RegisterRepository repository;
}
