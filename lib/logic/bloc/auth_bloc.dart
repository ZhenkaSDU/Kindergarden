import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_basics/logic/data/repositories/auth_repository.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());
      try {
        final Response response = await authRepository.getLogin(event.phone);
        emit(AuthSuccess(response));
      } on DioError catch (e) {
        emit(AuthFailure(e.response!));
      }
    });
    on<AuthSMS>((event, emit) async {
      emit(AuthLoading());
      try {
        final Response response = await authRepository.getSms(event.sms, event.id);
          emit(AuthSMSSuccess(response));
      } on DioError catch (e) {
        emit(AuthFailureCode(e.response!));
      }
    });
  }
}
