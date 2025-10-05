import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireBaseCreate extends StatefulWidget {
  const FireBaseCreate({super.key});

  @override
  State<FireBaseCreate> createState() => _FireBaseCreateState();
}

class _FireBaseCreateState extends State<FireBaseCreate> {
  TextEditingController nameController =TextEditingController();
  TextEditingController ageController =TextEditingController();
  TextEditingController locationController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Create"),backgroundColor: Colors.blue,),
      body: Column(children: [
        SizedBox(height: 20,),
        TextField(
          controller: nameController,
           decoration: InputDecoration(hintText: "Name",hintStyle: TextStyle(color: Colors.blue),enabledBorder: OutlineInputBorder()),),
        SizedBox(height: 20,),
        TextField(
          controller: ageController,
          decoration: InputDecoration(hintText: "age",hintStyle: TextStyle(color: Colors.blue),enabledBorder: OutlineInputBorder()),),
        SizedBox(height: 20,),
        TextField(
          controller: locationController,
          decoration: InputDecoration(hintText: "Location",hintStyle: TextStyle(color: Colors.blue),enabledBorder: OutlineInputBorder()),),
SizedBox(height: 20,),
          Container(
            width: 200,
            height: 35,
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white),
            
              onPressed: () async{
              

              
                  try{
                    String name=nameController.text.trim();
                    if(name.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter your name")));
                      return;
                    }
                    String age=ageController.text.trim();
                    if(age.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter your age")));
                      return;
                    }
                    String location=locationController.text.trim();
                    if(location.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter your location")));
                      return;
                    }

                  await FirebaseFirestore.instance.collection('user').add({
                      'name':name,
                      'age':int.parse(age),
                      'location':location,
                      'createdAt':FieldValue.serverTimestamp(),
                  });
                  
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully submit")));
                  nameController.clear();
                  ageController.clear();
                  locationController.clear();
                    
                  }
                  catch(e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error:$e")));
                  }
                },
            
   
   
   child: Text("Save")),
          ),

      ],),
);
  }
}