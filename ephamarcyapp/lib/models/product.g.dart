// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      name: json['name'] as String?,
      image: json['image'] as String?,
      isAvailable: json['isAvailable'] as bool?,
      description: json['description'] as String?,
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      productId: json['productId'] as String?,
      categoryname: json['categoryname'] as String?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'isAvailable': instance.isAvailable,
      'description': instance.description,
      'oldPrice': instance.oldPrice,
      'price': instance.price,
      'productId': instance.productId,
      'categoryname': instance.categoryname,
    };
