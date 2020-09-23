import 'package:flutter/material.dart';
import 'package:store_app/screens/products/products_screen.dart';
import 'package:store_app/screens/register_product/register_product_screen.dart';
import 'file:///C:/Users/Johnk/AndroidStudioProjects/store_app/lib/widgets/drawer/custom_drawer.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final List screens = [ProductsScreen(), RegisterProductScreen()];

  @override
  Widget build(BuildContext context) {

    void drawerOptionsIndex(int index) {
      Navigator.pop(context);
      setState(() {
        _index = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
          title: Text('Store'),
      ),
      drawer: CustomDrawer(drawerOptionsIndex),
      body: screens[_index],
    );
  }
}
