import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/blocs/drawer_bloc.dart';

class DrawerTile extends StatelessWidget {

  final int clickedIndex;

  DrawerTile(this.clickedIndex);
  @override
  Widget build(BuildContext context) {
    final drawerBloc = BlocProvider.of<DrawerBloc>(context);
    return ListTile(
      onTap: (){
        drawerBloc.sinkIndexDrawer.add(clickedIndex);
        Navigator.of(context).pop();
      },
      leading: Icon(Icons.shopping_cart),
      title: Text(
        'Produtos',
        style: TextStyle(
          fontSize: 16
        ),
      ),
    );
  }
}
