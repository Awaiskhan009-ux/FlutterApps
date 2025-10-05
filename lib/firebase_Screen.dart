import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FireBase_Screen extends StatefulWidget {
  const FireBase_Screen({super.key});

  @override
  State<FireBase_Screen> createState() => _FireBaseState();
}

class _FireBaseState extends State<FireBase_Screen> {
  TextEditingController NameController = TextEditingController();
  TextEditingController AgeController = TextEditingController();
  TextEditingController RollNoController = TextEditingController();
  TextEditingController ClassController = TextEditingController();

  @override

  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Text("App Bar"),),
      body: Padding(
        padding: const EdgeInsets.all(80),
        child: Column(
        
          children: [
          Container(
            width: 300,
            child: TextField( 
            
              controller: NameController,
            
              
              decoration: InputDecoration(
              
              hintText: "Student Name",
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.grey),),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.green))
            ),),
    
          ),//name
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 300,
              child: TextField(
                controller: AgeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Student age",
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.grey),),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.green))
                ),),
            ),
          ),
        
          //age
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 300,
              child: TextField(
                controller: RollNoController,
                decoration: InputDecoration(
                    hintText: "Student roll no",
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.grey),),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
          ),//roll no
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 300,
              child: TextField(
                controller: ClassController,
                decoration: InputDecoration(
                      hintText: "Student class",
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.grey),),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.green)),
                  ),
                     
              ),
            ),
          ),//class
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: 150,
                child: ElevatedButton(onPressed: () async{
                try{
                  String name =NameController.text.trim();
                  String age =AgeController.text.trim();
                  String rollNo =RollNoController.text.trim();
                  String StuClass =ClassController.text.trim();
                
                  

                  if(name.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter the Name"),backgroundColor: Colors.amber,));
                  return;
                  }
                    if(int.tryParse(age)==null){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("age must be a number"),backgroundColor: Colors.amber,));
                  return;
                  }
                    if(rollNo.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter the roll no"),backgroundColor: Colors.amber,));
                  return;
                  }
                    if(StuClass.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter the class"),backgroundColor: Colors.amber,));
                  return;
                  }
                   if(int.tryParse(rollNo)==null){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Roll No must be a number"),backgroundColor: Colors.amber,));
                  return;
                  }
                  
                  await FirebaseFirestore.instance.collection('student').add({
                    'name':name.trim(),
                    'age':int.parse(age.trim()),
                      'rollNo':int.parse(rollNo.trim()),
                      'StuClass':int.parse(StuClass.trim()),
                  });
                
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully sumbit"),backgroundColor: Colors.amber,));
                

NameController.clear();
AgeController.clear();
RollNoController.clear();
ClassController.clear();

                } catch(e){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error:$e "),backgroundColor: Colors.red,));
                }
                },
                
                child: Text("save"),
                ),),
            )
          ],),
      ),
    );
  
  }
}