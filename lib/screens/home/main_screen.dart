import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/blocs/drawer_bloc.dart';
import 'package:store_app/screens/products/products_screen.dart';
import 'package:store_app/screens/register_product/register_product_screen.dart';
import 'package:store_app/widgets/drawer/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List screens = [ProductsScreen(), RegisterProductScreen()];

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => DrawerBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Store'),
          ),
          drawer: CustomDrawer(),
          body: Builder(
            builder: (context){
              final drawerBloc = BlocProvider.of<DrawerBloc>(context);
              return StreamBuilder<int>(
                initialData: 0,
                stream: drawerBloc.outIndexDrawer,
                builder: (context, snapshot){
                  return screens[snapshot.data];
                },
              );
            },
          ),
        ));
  }
}
