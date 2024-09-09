import 'package:json_annotation/json_annotation.dart';

part 'product.model.g.dart';

@JsonSerializable()
class ProductModel {
  String id;
  String departmentId;
  String name;
  String desc;
  String imageUrl;
  String price;
  String type;

  ProductModel({
    required this.id,
    required this.departmentId,
    required this.name,
    required this.desc,
    required this.imageUrl,
    required this.price,
    required this.type,
  });

  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$ProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductModelToJson(this);
  }
}
