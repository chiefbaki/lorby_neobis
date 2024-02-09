import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorby_neobis/data/model/token_model.dart';
import 'package:lorby_neobis/presentation/bloc/login_bloc/login_event.dart';
import 'package:lorby_neobis/presentation/bloc/login_bloc/login_state.dart';
import 'package:lorby_neobis/domain/repository/register_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.repository}) : super(LoginInitial()) {
    on<MakeLoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        TokenModel res =
            await repository.postLogin(event.username, event.password);

        emit(LoginSuccess(token: res));
      } catch (e) {
        if (e is DioException) {
          emit(LoginError(error: e.toString()));
        }
      }
    });
  }
  final RegisterRepository repository;
}
