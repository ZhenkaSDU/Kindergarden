import 'package:json_annotation/json_annotation.dart';
part 'saveChild_models.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class SaveChild {
  final String sessionId;
  final String id;
  final String firstName;
  final String lastName;
  final String parents;


  SaveChild(this.sessionId, this.id, this.firstName, this.lastName, this.parents);
  // flutter pub run build_runner build --delete-conflicting-outputs

  factory SaveChild.fromJson(Map<String, dynamic> json) => _$SaveChildFromJson(json);
  
  Map<String, dynamic> toJson() => _$SaveChildToJson(this);

}