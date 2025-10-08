import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginSc.dart';
import 'package:flutter_application_1/RegisterFile.dart';

class LoginScreenFirebase extends StatefulWidget {
  const LoginScreenFirebase({super.key});

  @override
  State<LoginScreenFirebase> createState() => _LoginScreenFirebaseState();
}

class _LoginScreenFirebaseState extends State<LoginScreenFirebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen"),),
      body: Stack(
        children: [
        
        
      
          SizedBox.expand(
          
      child: Image.asset('assets/images/login.jpg',fit: BoxFit.cover,),
      
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150,top: 70),
            child: Container(child: Text("Hello",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),),
          ),
          Center(child: Column(
            
            mainAxisSize: MainAxisSize.min,
            children: [
              
              
              Container(
                width: 250,
                height: 50,
                 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,foregroundColor: Colors.black),
                  
                  onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScFire()));
                  }, child: Text("Login",style: TextStyle(fontSize: 18),))),
              SizedBox(height: 20,),
              Container(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,foregroundColor: Colors.black),
                
                  onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterFile()));
                  }, child: Text("Register",style: TextStyle(fontSize: 18),)),
              ),
            ],
          ),)
            
        ],
      ),
    );
  }
}