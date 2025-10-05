import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MainLogin.dart';
import 'package:flutter_application_1/RegisterFile.dart';
import 'package:flutter_application_1/auth_services.dart';
import 'package:flutter_application_1/google_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_application_1/google_auth.dart';


class LoginScFire extends StatefulWidget {
  const LoginScFire({super.key});

  @override
  State<LoginScFire> createState() => _LoginScFireState();
}

class _LoginScFireState extends State<LoginScFire> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late AuthServices _authServices;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
          
            SizedBox(height: 60),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back,color: Colors.black,)),

            Padding(
              padding: const EdgeInsets.only(left: 30),
              
              child: Text(
                "Welcome Back! Glad",
                style: TextStyle(fontSize: 20, color: Colors.orange),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "to see you, Again!",
                style: TextStyle(fontSize: 20, color: Colors.orange),
              ),
            ),
            SizedBox(height: 90),
            Container(
              width: 380,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  controller: emailController,

                  decoration: InputDecoration(
                    hint: Text("Enter your Email"),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 380,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter your Password",
                    suffixIcon: Icon(Icons.password),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                
                ),
                
              ),
    
            ),
            Padding(
              padding: const EdgeInsets.only(left: 230),
              child: TextButton(
                onPressed: () {},
                child: Text("Forot Password?"),
              ),
            ),
            
            SizedBox(height: 10),
            Container(
              width: 370,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () async {

if(emailController.text.isEmpty || passwordController.text.isEmpty){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email and password cannot be empty")));
return;
                  }
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      
                            


   
                      );
                    

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sussfully login")));
                      emailController.clear();
passwordController.clear();
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginAuthScreen()),);    

}
                      
               

                  
                  
              
                     on FirebaseAuthException catch(e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message??"login failled")));
                    };
                       
                  
  },
              
                  child: Text("Login"),
                  
                ),
                
              ),
            ),
            
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 2,
                    indent: 30,
                    endIndent: 10,
                  ),
                ),
                Text("OR Login with"),
                Expanded(
                  child: Divider(
                    indent: 10,
                    endIndent: 30,
                    color: Colors.grey,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                  
                Image.asset('assets/images/facebook.jpg', width: 50),
                GestureDetector(onTap: ()async{


                
                    try{
                       await  _authServices.signInWithGoogle();

                      if(UserCredential !=null){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign In successful")));
                      }


                    }
                    catch(e){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
                    }
                
                }, child: Image.asset('assets/images/google.jpg', width: 30)),
                Image.asset('assets/images/apple.jpg', width: 30),
              ],
            ),
            SizedBox(height: 100),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text("Don't have an account?"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterFile()));
                  },
                  child: Text(
                    "Register Now",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
} 
}
