

import 'package:ephamarcyapp/models/cart.dart';
import 'package:ephamarcyapp/services/cartservice.dart';
import 'package:ephamarcyapp/states/cartstate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartController extends StateNotifier<CartState>{
  final CartService _cartService;
  CartController(this._cartService):super(const CartState()){

  } 
  /*Stream<Cart> getCartItems(){
    state=state.copyWith(isLoading: true);
    final cartData=_cartService.getCartItems();
   // state=state.copyWith(cartModel: cartData);
    state=state.copyWith(isLoading: false);
  }

   */

  
}