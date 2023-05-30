import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ephamarcyapp/constants/firebaseconstants.dart';
import 'package:ephamarcyapp/core/failure.dart';
import 'package:ephamarcyapp/core/type_defs.dart';
import 'package:ephamarcyapp/models/cart.dart';
import 'package:ephamarcyapp/models/product.dart';
import 'package:ephamarcyapp/providers/firebaseproviders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
final cartServiceProvider=Provider((ref)=>CartService(firebaseFirestore: ref.watch(firebaseFirestoreProvider)));
class CartService{
  final FirebaseFirestore _firebaseFirestore;
  CartService({
    required FirebaseFirestore firebaseFirestore
  }):_firebaseFirestore=firebaseFirestore;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
   
CollectionReference get _cart =>_firebaseFirestore.collection(FirebaseConstants.cart);
 
  Either<dynamic,Future<void>> addToCart(int itemCount,String productId){
    User? user = firebaseAuth.currentUser;
    final userId = user!.uid.toString();
   try{
    return right( _cart.doc(userId).set({
      'itemCount':itemCount,
      'productId':[productId]
    }));
   }
   on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  FutureVoid deleteCartItem(String productId)async{
    User? user = firebaseAuth.currentUser;
    final userId = user!.uid.toString();
    try{
      return right(_cart.doc(userId).update({
        'productId':FieldValue.arrayRemove([productId])
      }));

    }
    on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Stream<Cart?>getCartItems(){
    User? user = firebaseAuth.currentUser;
    final userId = user!.uid.toString();
   return   _cart.doc(userId)
   .snapshots().map((event) => Cart.fromJson(event.data()as Map<String,dynamic>));
}}