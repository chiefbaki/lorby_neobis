import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/register_event.dart';
import 'package:lorby_neobis/presentation/bloc/register_state.dart';
import 'package:lorby_neobis/repository/register_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required this.repository}) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      emit(RegisterLoading());
      try {
         
      } catch (e) {
        print(e); 
      }
    });
  }
  final RegisterRepository repository;
}