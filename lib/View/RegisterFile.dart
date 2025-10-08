import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterFile extends StatefulWidget {
  const RegisterFile({super.key});

  @override
  State<RegisterFile> createState() => _RegisterFileState();
  
}

class _RegisterFileState extends State<RegisterFile> {
  TextEditingController EmailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController ConfirmPasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
    
      body: Stack(
        children: [
          SizedBox.expand(child: Image.asset('assets/images/login.jpg',fit: BoxFit.cover,)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                  SizedBox(height: 15,),
                  Center(
                    child: Column(
                      children: [
                        Text('Register',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                         Text("Create a new account",style: TextStyle(color: Colors.white,fontSize: 15),),
                         SizedBox(height: 30,),
                  
                      Container(
                    
                        width:500,
                        height:400,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration( color: Colors.white,),
                  
                          child: Column(children: [
                            SizedBox(height: 20,),
                           TextField(controller: EmailController, decoration: InputDecoration( hintText: "Enter email",enabledBorder: OutlineInputBorder(),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange))
                           ),),
                           SizedBox(height: 20,),
                           TextField(controller: passwordController, decoration: InputDecoration(hintText: "Enter password", enabledBorder: OutlineInputBorder(),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange))),),
                           SizedBox(height: 20,),
                           TextField (controller: ConfirmPasswordController, decoration: InputDecoration(hintText: "Enter confirm password", enabledBorder: OutlineInputBorder(),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange))),),
                           SizedBox(height: 30,),
                           ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,foregroundColor: Colors.white),
                            
                            onPressed: ()
                            
                            async{
                              final email=EmailController.text;
                              final password=passwordController.text;
                              final ConPassword=ConfirmPasswordController.text;

                              if(email.isEmpty||password.isEmpty||ConPassword.isEmpty){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all fields")));
                                return;
                              }
                              if(password!=ConPassword){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password dont match"))
  );
  ConfirmPasswordController.clear();
                                return;
                              }

                              try{
                                await FirebaseAuth.instance.createUserWithEmailAndPassword(email: EmailController.text.trim(), password: passwordController.text.trim());

                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account Created Succesfully")));
                                EmailController.clear();
                                passwordController.clear();
                          
                              }
                              on FirebaseAuthException catch(e){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message??"Registeration failled")));
                              };
                            } , child: Text("Create Account")),
                          ],),
                      
                  
                      ),
                                ],),
                              ),
                        ],
                
                      ),
              ),),
     ), ]  ),
        );
        
      
        
        
  }
  
}