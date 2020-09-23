import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginBloc{
  final GoogleSignIn googleSignIn = GoogleSignIn();
  //stream current user
  StreamController<User> _currentUserController = new StreamController<User>();
  Stream<User> get currentUser => _currentUserController.stream;
  StreamSink<User> get currentUserSink => _currentUserController.sink;

  LoginBloc(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        currentUserSink.add(user);
      }
    });
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
    await googleSignIn.disconnect();
  }

  void dispose(){
    _currentUserController.close();
  }
}