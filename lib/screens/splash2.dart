import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginscreen.dart';
import 'package:flutter_application_1/screens/SignUpScreen.dart';
import 'package:flutter_application_1/screens/loginScreen.dart';
import 'package:flutter_application_1/screens/SignUpScreen.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 100,),
            Center(child: Image.asset('assets/images/head.png',height: 25,fit: BoxFit.contain,)),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Image.asset('assets/images/text.png',height: 220,),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(right: 80),
              child: Image.asset('assets/images/text2.png'),
            ),
            SizedBox(height: 50,),
            Image.asset('assets/images/Social.png'),
            SizedBox(height: 20,), 
            Image.asset('assets/images/or.png'),
            SizedBox(height: 40,),
            Container(
              width:350,
              height: 55,
              child: ElevatedButton( 
              
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreenChat()));
                },
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15))),
                 child: Text("Sign up within email ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                Text("Exiting account? ",style: TextStyle(color: Colors.grey),),
                TextButton(onPressed: (){
        
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreenChat()));
                }, child: Text("Log in",style: TextStyle(color: Colors.white),)),
              ],
            )
        
            ],),
      ),);
  }
}