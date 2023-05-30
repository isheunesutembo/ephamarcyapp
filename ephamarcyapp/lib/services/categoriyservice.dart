
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ephamarcyapp/constants/firebaseconstants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/categoriesmodel.dart';
import '../providers/firebaseproviders.dart';
final categoriesServiceProvider=Provider((ref)=>CategoryService(firestore: ref.watch(firebaseFirestoreProvider)));
class CategoryService{
 final FirebaseFirestore _fireStore;

 CategoryService({
  required FirebaseFirestore firestore
 }):_fireStore=firestore;

 CollectionReference get _categories=>_fireStore.collection(FirebaseConstants.categories);
 Stream<List<Category>>getCategories(){
  return _categories.snapshots().map((event){
    List<Category>categoriesList=[];
    for (var doc in event.docs){
      categoriesList.add(Category.fromMap(doc.data()as Map<String,dynamic>));
    }
    return categoriesList;
  });
  
 }
}