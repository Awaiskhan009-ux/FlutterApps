import 'package:flutter/material.dart';

class SignUpScreenChat extends StatefulWidget {
  const SignUpScreenChat({super.key});

  @override
  State<SignUpScreenChat> createState() => _SignUpScreenChatState();
}

class _SignUpScreenChatState extends State<SignUpScreenChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Image.asset('assets/images/Signup.png'),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Image.asset("assets/images/SignUptext.png"),
        
            ),
             SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                
                children: [
              
                Container(
                
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                    
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: EdgeInsets.only(bottom: 15),
                      enabledBorder: UnderlineInputBorder(
                      
                      borderSide: BorderSide(color: Colors.grey,width: 0.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                                  
                        borderSide: BorderSide(color: Colors.grey,width: 0.5)
                      ),
                        label: Text("Your name",style: TextStyle(color: Colors.green.shade800,fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                    
                    ),
                  ),
                ),
              SizedBox(height: 20,),
                Container(
                  width: 300,
                  child: TextField(
                  
                  
                  
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 15),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: UnderlineInputBorder(
                    
                    borderSide: BorderSide(color: Colors.grey,width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey,width: 0.5)
                    ),
                      label: Text("Your email",style: TextStyle(color: Colors.green.shade800,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  
                  ),
                ),
                 SizedBox(height: 20,),
                Container(
                  width: 300,
                  child: TextField(
                  
                    obscureText: true,
                    obscuringCharacter: "*",
                  
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 15),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: UnderlineInputBorder(
                    
                    borderSide: BorderSide(color: Colors.grey,width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey,width: 0.5)
                    ),
                      label: Text("Password",style: TextStyle(color: Colors.green.shade800,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  
                  ),
                ),
              SizedBox(height: 20,),
                Container(
                  width: 300,
                  child: TextField(
                  
                    obscureText: true,
                    obscuringCharacter: "*",
                  
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 15),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: UnderlineInputBorder(
                    
                    borderSide: BorderSide(color: Colors.grey,width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey,width: 0.5)
                    ),
                      label: Text("Confirm Password",style: TextStyle(color: Colors.green.shade800,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  
                  ),
                ),
              ],),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30,top: 90),
              child: Column(
                children: [
                  Container(
                    width: 330,
                    height: 50,
                    child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.grey.shade600,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15))
                    ),
                     child: Text("Create an account"))),
                ],
              ),
            )
        
          
          ],
        ),
      ),
    );
  }
}