import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ReadFile.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final googleSignIn = GoogleSignIn();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication authentication = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken,
        );

        UserCredential user = await auth.signInWithCredential(credential);

        if(user != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReadFile()));
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }
                                  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Authentication'),
        backgroundColor: Colors.green,
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () async {
      //           await signInWithGoogle();
      //         },
      //         child: Text('Continue with Google'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
