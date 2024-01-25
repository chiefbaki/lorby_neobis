import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorby_neobis/data/model/success_register_message.dart';
import 'package:lorby_neobis/presentation/bloc/register_bloc/register_event.dart';
import 'package:lorby_neobis/presentation/bloc/register_bloc/register_state.dart';
import 'package:lorby_neobis/repository/register_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required this.repository}) : super(RegisterInitial()) {
    on<UserRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        SuccessRegisterMessageModel message = await repository.postRegisterModel(
            event.email, event.username, event.password, event.passwordConfirm);
        emit(RegisterSuccess(message:  message));
      } catch (e) {
        if (e is DioException) {
          emit(RegisterError(error: e.toString()));
        }
      }
    });
  }
  final RegisterRepository repository;
}
