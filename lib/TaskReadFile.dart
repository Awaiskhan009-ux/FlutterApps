 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ReadFile.dart';
import 'package:flutter_application_1/Update&Delete.dart';
import 'package:flutter_application_1/UpdateScreen.dart';

  class TaskReadFile extends StatefulWidget {
    const TaskReadFile({super.key});

    @override
    State<TaskReadFile> createState() => _TaskReadFileState();
  }

  class _TaskReadFileState extends State<TaskReadFile> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Read File"),),
        body: Column(children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('task').orderBy('createdAt',descending: false).snapshots(),
            builder: (context, Snapshot) {
              if(!Snapshot.hasData){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              } 
              final data=Snapshot.data!.docs;
              return ListView.builder(
          
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  
                  final task=data[index]['task'];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                    elevation: 5,
                    child: ListTile(
                      
                      tileColor: Colors.amber[50],
                      
                      leading:   CircleAvatar(backgroundColor: Colors.amber,child: Text('${index+1}'),),
                      title: Text(task,style:TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                      trailing: IconButton(onPressed: (){
                        final id =data[index].id;
                        final task =data[index]['task'];
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>UpdateScreen(docId:id,currentName: task,)));
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateScreen(),));
                      }, icon: Icon(Icons.edit)),
                      
                    ),
                  ) ;
                },
              );
            }
          ),
        ],),
      );
    }
  }