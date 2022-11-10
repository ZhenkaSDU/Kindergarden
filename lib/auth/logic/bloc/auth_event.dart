part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthLoadedEvent extends AuthEvent {}
