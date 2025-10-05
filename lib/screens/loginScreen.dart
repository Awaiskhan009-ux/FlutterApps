import 'package:flutter/material.dart';

class LoginScreenChat extends StatefulWidget {
  const LoginScreenChat({super.key});

  @override
  State<LoginScreenChat> createState() => _LoginScreenChatState();
}

class _LoginScreenChatState extends State<LoginScreenChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
          
            Center(child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset('assets/images/Logintext.png'),
            )),
            
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset('assets/images/welcomtext.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset('assets/images/Socialmedia.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset('assets/images/or.png',color: Colors.grey,),
            ),
            SizedBox(height: 30,),
          
            Container(
              width: 350,
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
                  label: Text("Your email",style: TextStyle(color: Colors.green.shade800,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
              
              ),
            ),
          SizedBox(height: 20,),
            Container(
              width: 350,
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
            SizedBox(height: 130,),
      
            Container(
              width: 350,
              height: 60,
          
          
              child: ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green.shade900,
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(18))
              ),
            
               child: Text("Log in"))),
               SizedBox(height: 15,),
               TextButton(onPressed: (){}, child: Text("Forgot password?",style: TextStyle(color: Colors.green.shade900),))
          
          ],),
        ),
      ),
    );
  }
}