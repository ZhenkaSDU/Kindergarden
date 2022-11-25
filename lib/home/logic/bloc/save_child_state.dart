part of 'save_child_bloc.dart';

abstract class SaveChildState {}

class SaveChildInitial extends SaveChildState {}

class SaveChildLoading extends SaveChildState {}

class SaveChildSuccess extends SaveChildState {
  final String res;

  SaveChildSuccess(this.res);
}

class SaveChildFailure extends SaveChildState {
  final Response response;

  SaveChildFailure(this.response);
}
