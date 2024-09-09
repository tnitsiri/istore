import 'package:json_annotation/json_annotation.dart';

part 'department.model.g.dart';

@JsonSerializable()
class DepartmentModel {
  String id;
  String name;
  String imageUrl;

  DepartmentModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory DepartmentModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$DepartmentModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DepartmentModelToJson(this);
  }
}
