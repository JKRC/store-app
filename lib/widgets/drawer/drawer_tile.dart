import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final Function drawerOptionsIndex;
  final int clickedIndex;

  DrawerTile(this.drawerOptionsIndex, this.clickedIndex);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        this.drawerOptionsIndex(this.clickedIndex);
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
