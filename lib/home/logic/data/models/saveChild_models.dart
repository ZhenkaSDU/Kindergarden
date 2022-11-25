import 'package:json_annotation/json_annotation.dart';
part 'saveChild_models.g.dart';
@JsonSerializable()
class SaveChild {
  final String session_id;
  final String id;
  final String first_name;
  final String last_name;
  final String parents;


  SaveChild(this.session_id, this.id, this.first_name, this.last_name, this.parents);
  // flutter pub run build_runner build --delete-conflicting-outputs

  factory SaveChild.fromJson(Map<String, dynamic> json) => _$SaveChildFromJson(json);
  Map<String, dynamic> toJson() => _$SaveChildToJson(this);
}