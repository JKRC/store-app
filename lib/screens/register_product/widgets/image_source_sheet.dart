import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {

  ImageSourceSheet(this.onImageSelected);

  final Function(File) onImageSelected;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: (){},
      builder: (context){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlatButton(
              child: const Text('Camera'),
              onPressed: () async{
                final pickedFile = await picker.getImage(source: ImageSource.camera);
                final File image = File(pickedFile.path);
                onImageSelected(image);
              },
            ),
            FlatButton(
              child: const Text('Galeria'),
              onPressed: () async{
                final pickedFile = await picker.getImage(source: ImageSource.gallery);
                final File image = File(pickedFile.path);
                onImageSelected(image);
              },
            )
          ],
        );
      },
    );
  }
}
