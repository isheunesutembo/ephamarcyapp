// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductItem _$$_ProductItemFromJson(Map<String, dynamic> json) =>
    _$_ProductItem(
      quantity: json['quantity'] as int,
      productItem:
          Product.fromJson(json['productItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductItemToJson(_$_ProductItem instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'productItem': instance.productItem,
    };
