import'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';
part 'product.g.dart';
List<Product> productFromJson(dynamic str) =>
 List<Product>.from((str).map((e) => Product.fromJson(e)));
@freezed

abstract  class Product with _$Product {
 
 factory Product({
  String? name,
 String? image,
 bool? isAvailable,
 String? description,
 double? oldPrice,
 double? price,
 String? productId,
 String? categoryname
 })=_Product;
  factory Product.fromJson(Map<String,dynamic>json)=> _$ProductFromJson(json);
}
