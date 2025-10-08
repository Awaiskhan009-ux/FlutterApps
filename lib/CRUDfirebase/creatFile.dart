import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ReadFile.dart';
import 'package:flutter_application_1/TaskReadFile.dart';

class CreateFile extends StatefulWidget {
  const CreateFile({super.key});

  @override
  State<CreateFile> createState() => _CreateFileState();
}

class _CreateFileState extends State<CreateFile> {
  TextEditingController TaskValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Task App"),
      backgroundColor: Colors.amber,
      
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: TaskValue,
            decoration: InputDecoration(hintText: "Enter your task",border: OutlineInputBorder()),
          ),
        ),
        SizedBox(height: 5,),
        Container(
          width: 200,
          height: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black
            ),
            onPressed: ()
           
          
          async{
             try{
              String Task=TaskValue.text.trim();
          
              if(Task.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter Task")));
          return;
              }
              FirebaseFirestore.instance.collection('task').add({
                'task':Task,
                  'createdAt': FieldValue.serverTimestamp(),
              });
          
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task sussfully submit")));
          
              TaskValue.clear();
             }
             catch(e){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error:$e")),);
             }
            
          
          
             },
                 
            
          
            
           child: Text('Save',style: TextStyle(fontSize: 18,),),),
           
        ),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskReadFile()));
        }, child: Text("Read file")),
      ]),
    );
    
  }
}