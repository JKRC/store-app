import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/blocs/create_bloc.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/screens/register_product/widgets/images_field.dart';

class RegisterProductScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Product product = Product();
    CreateBloc _createBloc = CreateBloc();

    return Container(
        child: Form(
      key: _formKey,
      child: ListView(
        children: [
          ImagesField(
            onSaved: (List<File> images) {
              product.images = images;
            },
            initialValue: [],
          ),
          TextFormField(
            decoration: inputDecoration('Título'),
            validator: (text) {
              if (text.isEmpty) return 'Campo Obrigatório';
              return null;
            },
            onSaved: (t) {
              product.title = t;
            },
          ),
          TextFormField(
            maxLines: null,
            decoration: inputDecoration('Descrição'),
            validator: (text) {
              return null;
            },
            onSaved: (t) {
              product.description = t;
            },
          ),
          TextFormField(
            decoration: inputDecoration('Preço'),
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true, signed: false),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
              RealInputFormatter(centavos: true)
            ],
            validator: (text) {
              if (text.trim().isEmpty) return 'Campo obrigatório';
              return null;
            },
            onSaved: (price) {
              product.price = int.parse(getSanitizedText(price)) / 100;
            },
          ),
          saveButton(_createBloc, product)
        ],
      ),
    ));
  }

  String getSanitizedText(String text) {
    return text.replaceAll(RegExp(r'[^\d]'), '');
  }

  inputDecoration(String title) {
    return InputDecoration(
        labelText: '$title *',
        labelStyle: TextStyle(
            fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 18),
        contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10));
  }

  saveButton(CreateBloc _createBloc, Product product) {
    return Container(
      height: 50,
      child: RaisedButton(
        color: Colors.pink,
        child: Text(
          'Enviar',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            final bool success = await _createBloc.saveProduct(product);

            if (success) {
              //save succesfully!
            }
          }
        },
      ),
    );
  }
}
