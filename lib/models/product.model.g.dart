// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String,
      departmentId: json['departmentId'] as String,
      name: json['name'] as String,
      desc: json['desc'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'departmentId': instance.departmentId,
      'name': instance.name,
      'desc': instance.desc,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'type': instance.type,
    };
