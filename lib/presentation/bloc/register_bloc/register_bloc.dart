import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/register_bloc/register_event.dart';
import 'package:lorby_neobis/presentation/bloc/register_bloc/register_state.dart';
import 'package:lorby_neobis/repository/register_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required this.repository}) : super(RegisterInitial()) {
    on<UserRegisterEvent>((event, emit) {
      emit(RegisterLoading());
      try {
        repository.postRegisterModel(
            event.email, event.username, event.password, event.passwordConfirm);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterError(error: e.toString()));
      }
    });
  }
  final RegisterRepository repository;
}
