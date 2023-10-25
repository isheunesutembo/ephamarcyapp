import 'package:ephamarcyapp/components/relatedproductswidget.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Stack(
            children: [
              Image.network(
                product.image!,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Colors.black,
                    ),
                  )),
              const Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.shopping_basket,
                    color: Colors.blue,
                    size: 25,
                  )),
              const Positioned(
                  top: 10,
                  right: 60,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.blue,
                    size: 25,
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              product.name!,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.description!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "\$${product.oldPrice}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
              child: SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Add To Cart")))),
          const SizedBox(height: 32),
          
               const   Center(
                    child: Text("You Might Also Like",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),
                
          
          const SizedBox(height: 16),
          RelatedProductsWidget(
            categoryname: product.categoryname.toString(),
          )
        ],
      )),
    );
  }
}
