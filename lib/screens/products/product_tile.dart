import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';

class ProductTile extends StatelessWidget {
  ProductTile(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              photosProduct(),
              titlePrice()
            ],
          ),
        ),
      ),
    );
  }

  titlePrice(){
    return Row(
      children: [
        Expanded(
            child: Text(
              product.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
            )
        ),
        Text(
          '${product.price.toString()} R\$',
          style: TextStyle(
              color: Colors.lightGreen
          ),
        )
      ],
    );
  }

  photosProduct() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.urlImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 5, bottom: 10),
            child: Container(
              height: 150,
              child: Image.network(product.urlImages[index]),
            ),
          );
        },
      ),
    );
  }
}
