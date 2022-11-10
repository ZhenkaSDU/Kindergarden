part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthLoadList extends AuthEvent {}

class AuthLogin extends AuthEvent {
  final String phone;

  AuthLogin(this.phone);
}

class AuthSMS extends AuthEvent {
  final String sms;
  final String id;

  AuthSMS(this.sms,this.id);
}

