import 'package:flutter/material.dart';
import 'package:store_app/blocs/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: FlutterLogo(
              size: MediaQuery.of(context).size.height/3,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(50),
              height: 50,
              width: MediaQuery.of(context).size.width*0.75,
              child: _buttonLogin(context),
            ),
          )
        ],
      ),
    );
  }
}

RaisedButton _buttonLogin(BuildContext context){
  return RaisedButton(
    color: Theme.of(context).primaryColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: Theme.of(context).primaryColor)
    ),
    onPressed: () async{
      var res = await LoginBloc.signInWithGoogle();
      print(res);
    },
    child: Text(
        'Entrar com o Google',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
    ),
  );
}
