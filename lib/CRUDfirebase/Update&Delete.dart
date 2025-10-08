import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UpdateDeleteFile extends StatefulWidget {
  const UpdateDeleteFile({super.key});

  @override
  State<UpdateDeleteFile> createState() => _UpdateDeleteFileState();
}

class _UpdateDeleteFileState extends State<UpdateDeleteFile> {
  TextEditingController nameController=TextEditingController();
  String? selectedId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Crud Operation"),),
    body: Column(children: [
             if(selectedId !=null)
             Column( children: [
              TextField(controller: nameController,
              decoration: InputDecoration(
                hintText: 'Update name',
                border: OutlineInputBorder(),
              ),

              ),

              ElevatedButton(onPressed: (){
               FirebaseFirestore.instance.collection('student').doc(selectedId).update({
                'name':nameController.text,
               });

              }, child:Text("update")),
             ],),

       StreamBuilder(
         stream:FirebaseFirestore.instance.collection('student').snapshots(),
         builder: (context, snapshot) {
           if(!snapshot.hasData){
            Column(children: [Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator(),),
            )],);

           }
           final data= snapshot.data!.docs;

           return ListView.builder(
            shrinkWrap: true,
             itemCount: data.length,
             itemBuilder: (BuildContext context, int index) {

                   final name=data[index]['name'];
                   final age=data[index]['age'];
                   String id =data[index].id;
               return ListTile(
                leading: IconButton(onPressed: (){
                  setState(() {
                    selectedId=id;
                  });
                }, icon: Icon(Icons.edit)),
                title: Text(name),
                subtitle: Text("age is:$age"),
                trailing: IconButton(onPressed: (){
                  FirebaseFirestore.instance.collection('student').doc(id).delete();
                }, icon: Icon(Icons.delete)),
               ) ;
             },
           );
         }
       ),
   ],),
    );
  }
}