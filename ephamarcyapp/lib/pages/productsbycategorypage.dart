import 'package:ephamarcyapp/pages/productdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/errorwidget.dart';
import '../components/loader.dart';
import '../controllers/productcontroller.dart';

class ProductsByCategoryPage extends ConsumerWidget {
  String categoryname;
   ProductsByCategoryPage({required this.categoryname,super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final products=ref.watch(getProductsByCategoryProvider(categoryname));
    return Scaffold(appBar: AppBar(backgroundColor: Colors.white,
    iconTheme: Theme.of(context).iconTheme,),
    body: products.when(data: (data){
      return 
      data.isNotEmpty?
      GridView.builder(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2/3,
      ),
      itemCount: data.length,
      shrinkWrap: true,
      physics:const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context,index){
        return Padding(padding:const EdgeInsets.all(2),
        child:GestureDetector(
          onTap:(){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductDetailsPage(),
            settings: RouteSettings(arguments: data[index])));
          },
          child: Card(
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
        
            ),
            elevation: 1
            ,child:Container(
              height:180,
              width:180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
        child:Column(
          children:[
            Image.network(data[index].image!,
            fit: BoxFit.fitHeight,
            height:150
            
            ),
            Center(child: Text(data[index].name!,
            style:const TextStyle(fontSize:20,
            color:Colors.grey,
            fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height:16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          Text("\$${data[index].price}",
          style:const TextStyle(fontSize:20,
          color:Colors.blue,
          fontWeight: FontWeight.bold),),
          Text("\$${data[index].oldPrice}",
          style:const TextStyle(fontSize:20,
          color:Colors.black,
          fontWeight: FontWeight.bold,decoration:TextDecoration.lineThrough ),),
              ],
            )
          ]
        )
            ) ,),
        ));
      },
    ):const Center(child:Text("No products in this category",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),));

    }, error: (error,stackTrace)=>ErrorText(error: error.toString(),), loading:()=>const Loader()) );
  }
}