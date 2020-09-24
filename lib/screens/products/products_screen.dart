import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/screens/products/product_tile.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('products').get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }
        else if (snapshot.data.docs.length == 0) {
          return Center(child: Text('Não há items'),);
        }
        else {
          List products = snapshot.data.docs;
          return Padding(
            padding: EdgeInsets.all(12),
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index){
                return ProductTile(Product.fromJson(products[index].data()));
              },
            ),
          );
        }
      },
    );
  }
}
