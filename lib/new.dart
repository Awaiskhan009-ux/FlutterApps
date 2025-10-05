import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App bar"),
      
      ),
      body: Column(children: [
        Container(width: 200,height: 200, color: Colors.amber,
        ),
        Container(width: 300,height: 100,color: Colors.amberAccent,),
      ],),
    );
  }
}