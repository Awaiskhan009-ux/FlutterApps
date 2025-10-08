import 'package:flutter/material.dart';
import 'package:flutter_application_1/FireAuthLogin.dart';
import 'package:flutter_application_1/RegisterFile.dart';
import 'package:flutter_application_1/loginscreen.dart';

class LoginAuthScreen extends StatefulWidget {
  const LoginAuthScreen({super.key});

  @override
  State<LoginAuthScreen> createState() => _LoginAuthScreenState();
}

class _LoginAuthScreenState extends State<LoginAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
       Image.asset('assets/images/login2.jpg',height: 350,width: 500,fit: BoxFit.cover,),
      
       Text("Hello",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
       Text("Welcome To Littile Drop, Where",style: TextStyle(fontSize: 13,color: Colors.grey.shade600),),
       Text("you manage you daily task",style: TextStyle(fontSize: 13,color: Colors.grey.shade600),),
       
       Container(
        width: 250,
        height: 35,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade900,foregroundColor: Colors.white),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FirebaseAuthLogin()));
          }, child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold),))),
        SizedBox(height: 20,),
       Container(
        width: 250,
        height: 35,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white,foregroundColor: Colors.blue.shade900,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterFile()));
            
          }, child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),))),
          SizedBox(height: 20,),
          Text("Sign Up using",style: TextStyle(color: Colors.grey.shade500),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.facebook,color: Colors.blue,),Icon(Icons.facebook),Icon(Icons.facebook),],)
      ],),
    );
  }
}