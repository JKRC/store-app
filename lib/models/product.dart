import 'dart:io';

class Product{
  List<File> images;
  List<String> urlImages;
  String title;
  String description;
  num price;

  Map<String, dynamic> toJson(){
    return {
      'urlImages': urlImages,
      'title': title,
      'description': description,
      'price': price
    };
  }
}