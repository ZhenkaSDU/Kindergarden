part of 'save_child_bloc.dart';

abstract class SaveChildEvent {}

class SaveData extends SaveChildEvent {
  final String sessionId;
  final String id;
  final String firstName;
  final String lastName;
  final String parents;

  SaveData(this.sessionId,this.id,this.firstName,this.lastName,this.parents);
}

