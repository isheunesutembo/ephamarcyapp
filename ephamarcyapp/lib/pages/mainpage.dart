import 'package:ephamarcyapp/components/homecategorywidget.dart';
import 'package:ephamarcyapp/components/productwidget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return const Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 50,),
          Card(
            elevation: 1,
            
            child: SizedBox(
              height: 60,
              child:TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search,size:20,color: Colors.black,),
                  suffixIcon: Icon(Icons.tune),
                  hintText: 'Search Product',
                  hintStyle: TextStyle(color: Colors.black,fontSize: 18),
                  contentPadding: EdgeInsets.only(top:12)
                ),
              ),
            ),
          ),
          SizedBox(height: 16,),
      HomeCategoryWidget(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween
              ,children:[
              Text("Products",style: TextStyle(color:Colors.blue,fontSize:25,fontWeight:FontWeight.bold),),
              Text("See All",
              style:TextStyle(color:Colors.blue,fontSize:15,fontWeight:FontWeight.bold))
            ],),
          ),
        Padding(
            padding: EdgeInsets.all(8.0),
            child: ProductWidget(),
          )
        ],
      )),
    );
  }
}
