

import 'package:ephamarcyapp/models/cart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cartstate.freezed.dart';
@freezed
class CartState with _$CartState{
  const factory CartState({
    Cart? cartModel,
    
       @Default(false) bool isLoading,
  })=_CartState;
}