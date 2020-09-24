import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/screens/register_product/widgets/images_field.dart';

class RegisterProductScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      key: _formKey,
      child: ListView(
        children: [
          ImagesField(
            onSaved: (images) {},
            initialValue: [],
          ),
          TextFormField(
            decoration: inputDecoration('Título'),
            validator: (text) {
              if (text.isEmpty) return 'Campo Obrigatório';
              return null;
            },
            onSaved: (t) {},
          ),
          TextFormField(
            maxLines: null,
            decoration: inputDecoration('Descrição'),
            validator: (text) {
              return null;
            },
            onSaved: (t) {},
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
              if (double.tryParse(text) == null)
                return 'Utilize valores válidos';
              return null;
            },
          ),
          saveButton()
        ],
      ),
    ));
  }

  inputDecoration(String title) {
    return InputDecoration(
        labelText: '$title *',
        labelStyle: TextStyle(
            fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 18),
        contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10));
  }

  saveButton() {
    return Container(
      height: 50,
      child: RaisedButton(
        color: Colors.pink,
        child: Text(
          'Enviar',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
          }
        },
      ),
    );
  }
}
