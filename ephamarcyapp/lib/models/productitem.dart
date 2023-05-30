

import 'package:ephamarcyapp/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'productitem.freezed.dart';
part 'productitem.g.dart';
@freezed 
abstract class ProductItem with _$ProductItem{
  factory ProductItem({
    required int quantity,
    required Product  productItem

  })= _ProductItem;

 factory ProductItem.fromJson(Map<String,dynamic>json)=>_$ProductItemFromJson(json);

}