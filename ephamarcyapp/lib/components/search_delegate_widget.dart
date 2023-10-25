
import 'package:ephamarcyapp/components/errorwidget.dart';
import 'package:ephamarcyapp/components/loader.dart';
import 'package:ephamarcyapp/controllers/productcontroller.dart';
import 'package:ephamarcyapp/pages/productdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchProducts extends SearchDelegate{
  final WidgetRef ref;
  SearchProducts(this.ref);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query='';
      },icon:Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    final products=ref.watch(searchProductsProvider(query));
     return products.when(data: (data){
      return 
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
    );

    }, error: (error,stackTrace)=>ErrorText(error: error.toString(),), loading:()=>const Loader());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final products=ref.watch(searchProductsProvider(query));
     return products.when(data: (data){
      return 
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
    );

    }, error: (error,stackTrace)=>ErrorText(error: error.toString(),), loading:()=>const Loader());
  }

}