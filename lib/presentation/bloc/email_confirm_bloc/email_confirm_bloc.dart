import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorby_neobis/data/model/success_confirm_email.dart';
import 'package:lorby_neobis/presentation/bloc/email_confirm_bloc/email_confirm_event.dart';
import 'package:lorby_neobis/presentation/bloc/email_confirm_bloc/email_confirm_state.dart';
import 'package:lorby_neobis/domain/repository/register_repository.dart';

class EmailConfirmBloc extends Bloc<EmailConfirmEvent, EmailConfirmState> {
  EmailConfirmBloc({required this.repository}) : super(EmailConfirmInitial()) {
    on<MakeEmailConfirm>((event, emit) async {
      try {
        SuccessConfirmMessageModel message =
            await repository.postEmailConfirm(event.confirmationCode);
        emit(EmailConfirmSuccess(message: message));
      } catch (e) {
        if (e is DioException) {
          emit(EmailConfirmError(error: e.toString()));
        }
      }
    });
  }
  final RegisterRepository repository;
}
