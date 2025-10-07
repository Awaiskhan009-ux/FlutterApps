import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthProvider with ChangeNotifier{

final FirebaseAuth _auth =FirebaseAuth.instance;

User? _user;
User? get user=>_user;

AuthProvider(){
  _auth.authStateChanges().listen(_onAuthStateChanged);
}

Future<void> signUp(String email,String password) async{
  try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);

  }
  catch(e){
    print("SignUpt Error :$e");
  }
}

Future<void> SignIn(String email,String password) async{
  try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);

  }
  catch(e){
    print("Login Error: $e");
  }
}

Future<void> singOut() async{
  await _auth.signOut();
}

void _onAuthStateChanged(User? user){
  _user = user;
  notifyListeners();
}
  
}