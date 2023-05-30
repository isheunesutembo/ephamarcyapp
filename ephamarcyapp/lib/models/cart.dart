import 'package:ephamarcyapp/models/productitem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  factory Cart({required String userId, required List<ProductItem> products}) =
      _Cart;
  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

extension CartExt on Cart {
  double get grandTotal {
    return products.map((e) => e.productItem.price).fold(0, (p, c) => p + c!);
  }
}
