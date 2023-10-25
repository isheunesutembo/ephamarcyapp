import 'package:ephamarcyapp/components/homecategorywidget.dart';
import 'package:ephamarcyapp/components/productwidget.dart';
import 'package:ephamarcyapp/components/search_delegate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(onTap:(){
           showSearch(context: context,delegate: SearchProducts(ref));
          },child:const Padding(
            padding:  EdgeInsets.all(8.0),
            child:  Icon(Icons.search,size:25,color:Colors.black),
          ))
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            HomeCategoryWidget(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("See All",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ProductWidget(),
            )
          ],
        )),
      ),
    );
  }
}
