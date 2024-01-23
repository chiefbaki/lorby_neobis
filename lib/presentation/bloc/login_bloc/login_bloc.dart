import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/login_bloc/login_event.dart';
import 'package:lorby_neobis/presentation/bloc/login_bloc/login_state.dart';
import 'package:lorby_neobis/repository/register_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.repository}) : super(LoginInitial()) {
    on<MakeLoginEvent>((event, emit) {
      emit(LoginLoading());
      try {
         repository.postLogin(event.username, event.password);
      } catch (e) {
        emit(LoginError(error: e.toString()));
      }
    });
  }
  final RegisterRepository repository;
}