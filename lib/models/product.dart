import 'dart:io';

class Product{
  List<File> images;
  List<String> urlImages;
  String title;
  String description;
  num price;

  Product();

  Product.fromJson(Map<String, dynamic> product){
    urlImages = [];

    List listUrlImages = product['urlImages'];
    listUrlImages.forEach((urlImage) {
      urlImages.add(urlImage);
    });

    title = product['title'];
    description = product['description'];
    price = product['price'];
  }

  Map<String, dynamic> toJson(){
    return {
      'urlImages': urlImages,
      'title': title,
      'description': description,
      'price': price
    };
  }
}