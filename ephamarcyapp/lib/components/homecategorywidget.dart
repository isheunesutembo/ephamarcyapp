import 'package:ephamarcyapp/components/errorwidget.dart';
import 'package:ephamarcyapp/components/loader.dart';
import 'package:ephamarcyapp/controllers/categorycontroller.dart';
import 'package:ephamarcyapp/pages/productsbycategorypage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeCategoryWidget extends ConsumerWidget {
  const HomeCategoryWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return  Container(
      height: 150,
      child: ref.watch(getCategoriesProvider).when(data:(data){
       return ListView.builder(
        shrinkWrap: true,
        physics:const ClampingScrollPhysics()
        ,itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return Padding(padding:const EdgeInsets.all(8.0),
          
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductsByCategoryPage(categoryname: data[index].name.toString(),)));
              },
              child: Column(
                children:[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child:Image.network(
                      data[index].image!,
                      fit: BoxFit.cover,
                      height:60,
                      width: 60,
                    )
                  ),
                  Text(data[index].name!,
                  style:const TextStyle(color:Colors.black,
                  fontSize:15,
                  fontWeight: FontWeight.bold),)
                ]
              ),
            ),
          );

        },
      );
      } ,error: (error,stackTrace)=>ErrorText(error: error.toString(),),loading: ()=>Loader()));
    
  }
}