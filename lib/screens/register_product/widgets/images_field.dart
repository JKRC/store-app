import 'package:flutter/material.dart';

import 'image_source_sheet.dart';

class ImagesField extends StatelessWidget {

  ImagesField({this.onSaved, this.initialValue});

  final FormFieldSetter<List> onSaved;
  final List initialValue;

  final Function validateImages = (List images){
    if (images.isEmpty) return 'Campo obrigatório';
    return null;
  };

  @override
  Widget build(BuildContext context) {
    return FormField<List>(
      validator: validateImages,
      initialValue: initialValue,
      onSaved: onSaved,
      builder: (state) {
        return Column(
          children: [
            listPhotos(state),
            if (state.hasError)
              textError(state)
          ],
        );
      },
    );
  }

  textError(state){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.centerLeft,
      child: Text(
        state.errorText,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  listPhotos(state){
    return Container(
      color: Colors.grey[200],
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.value.length + 1,
        itemBuilder: (context, index) {
          if (index == state.value.length) {
            return addPhotos(state, context);
          }
          return photoAvatar(context, state, index);
        },
      ),
    );
  }

  modalBottomSheet(state, context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => ImageSourceSheet((image) {
              if (image != null) state.didChange(state.value..add(image));
              Navigator.of(context).pop();
            }));
  }

  addPhotos(state, context) {
    return GestureDetector(
      onTap: () {
        modalBottomSheet(state, context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        child: CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 52,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt,
                size: 50,
                color: Colors.white,
              ),
              Text(
                '+ inserir',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }

  photoAvatar(context, state, index) {
    return GestureDetector(
      onTap: () {
        showImage(context, state, index);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        child: CircleAvatar(
          radius: 52,
          backgroundImage: FileImage(state.value[index]),
        ),
      ),
    );
  }

  showImage(context, state, index) {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.file(state.value[index]),
                  FlatButton(
                    child: const Text('Excluir'),
                    color: Colors.red,
                    onPressed: () {
                      state.didChange(state.value..removeAt(index));
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ));
  }
}
