import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/TaskReadFile.dart';

class FirebaseAuthLogin extends StatefulWidget {
  const FirebaseAuthLogin({super.key});

  @override
  State<FirebaseAuthLogin> createState() => _FirebaseAuthLoginState();
}

class _FirebaseAuthLoginState extends State<FirebaseAuthLogin> {
  @override
  TextEditingController SignEmailController = TextEditingController();
  TextEditingController SignPasswordController = TextEditingController();
  TextEditingController SignConfirmPassController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              "Hello",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Create Your Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            elevation: 10,
            shadowColor: Colors.blue.shade900,

            child: TextField(
              controller: SignEmailController,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            elevation: 10,
            shadowColor: Colors.blue.shade900,

            child: TextField(
              obscureText: true,
              controller: SignPasswordController,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            shadowColor: Colors.blue.shade900,

            child: TextField(
              obscureText: true,
              controller: SignConfirmPassController,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: 300,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.blue.shade900,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => TaskReadFile()),
                // );
                // if(SignConfirmPassController.text.isEmpty){
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter confim password also")));
                // }

                if (SignPasswordController.text.trim() !=
                    SignConfirmPassController.text.trim()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Password dont match Or Confirm Password is emapty")),
                  );
                  return;
                }
                if (SignEmailController.text.isEmpty) {}
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: SignEmailController.text.trim(),
                    password: SignPasswordController.text.trim(),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Succesfully submit"),backgroundColor: Colors.green,));
                  

                  SignEmailController.clear();
                  SignPasswordController.clear();
                  SignConfirmPassController.clear();
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Error:$e")));
                }
                
              },
              child: Text("Sign Up", style: TextStyle(fontSize: 18)),
              
            ),
          ),
        ],
      ),
    );
  }
}
