part of 'saveChild_bloc.dart';

@immutable
abstract class SaveChildState {}

class SaveChildInitial extends SaveChildState {}

class SaveChildLoading extends SaveChildState {}

class SaveChildFailure extends SaveChildState {
  final String errorMessage;

  SaveChildFailure(this.errorMessage);
}

class SaveChildSuccess extends SaveChildState {
  final String saveChild;

  SaveChildSuccess(this.saveChild);

}
