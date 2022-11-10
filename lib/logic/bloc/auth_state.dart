part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final Response response;

  AuthSuccess(this.response);
}

class AuthSMSSuccess extends AuthState {
  final Response response;

  AuthSMSSuccess(this.response);
}

class AuthFailure extends AuthState {
  final Response response;

  AuthFailure(this.response);
}

class AuthFailureCode extends AuthState{
  final Response response;

  AuthFailureCode(this.response);
}