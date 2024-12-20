import 'package:firestore/category/view/category_screen.dart';
import 'package:firestore/product/view/add_product_screen.dart';
import 'package:firestore/user/view/user_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> list = [
    UserScreen(),
    AddProductScreen(),
     CategoryScreen()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (context) {
          index = context;
          setState(() {});
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits), label: 'User'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: 'Product'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Category'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'My Profile'),
        ],
      ),
      body: list[index],
    ));
  }
}
