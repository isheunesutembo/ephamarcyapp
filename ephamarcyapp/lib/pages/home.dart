import 'package:ephamarcyapp/pages/cartpage.dart';
import 'package:ephamarcyapp/pages/favouritepage.dart';
import 'package:ephamarcyapp/pages/mainpage.dart';
import 'package:ephamarcyapp/pages/profilepage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex=0;
  void _onItemTap(int index){
    setState(() {
      selectedIndex=index;
    });
  }
  List<Widget>pages= const [
    MainPage(),
    FavouritePage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        currentIndex: selectedIndex,
        onTap: _onItemTap,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home,
          color: Colors.blue,
          size: 30,),
          label: 'Home'),
           BottomNavigationBarItem(icon: Icon(Icons.favorite_outline,
          color: Colors.blue,
          size: 30,),
          label: 'Favourite'),
           BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined,
          color: Colors.blue,
          size: 30,),
          label: 'Cart'),
           BottomNavigationBarItem(icon: Icon(Icons.person,
          color: Colors.blue,
          size: 30,),
          label: 'Profile')
        ],
      ),
      body: pages[selectedIndex],
      
    );
  }
}