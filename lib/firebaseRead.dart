import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseRead extends StatefulWidget {
  const FirebaseRead({super.key});

  @override
  State<FirebaseRead> createState() => _FirebaseReadState();
}

class _FirebaseReadState extends State<FirebaseRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Read File"),),
      body: Column(children: [
        

        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('user').orderBy('createdAt',descending: false).snapshots(),
          builder: (context, Snapshot) {


            if(!Snapshot.hasData){
             return Padding(
               padding: const EdgeInsets.all(8.0),
                child: Column(children: [Center(child: CircularProgressIndicator(),)],),
              );
            }
            final data=Snapshot.data!.docs;
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
              
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final name=data[index]['name'];
                  final age=data[index]['age'];
                  final location=data[index]['location']; 
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                    elevation: 10,
                    child: ListTile(
                      // leading: CircleAvatar(backgroundColor: Colors.blue,child: Text('${index+1}'),),
                      // title: Text(name,style: TextStyle(fontSize: 24),),
                      //  trailing: Text(location,style: TextStyle(fontSize: 20),),
                      // subtitle: Text(age.toString(),style: TextStyle(fontSize: 16),),

                      leading: CircleAvatar(backgroundColor: Colors.blue,child: Text('${index+1}'),),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(name,style: TextStyle(fontSize: 20),),
                        
                      ), 
                    
                      
                      subtitle: Column(children: [Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Text(age.toString()),
                      ),
                      SizedBox(width: 100,),
                      Text(location,style: TextStyle(fontSize: 12),)],),
              
                    ),
              
                  ) ;
                },
              ),
            );
          }
        ),
      ],),
    );
  }
}