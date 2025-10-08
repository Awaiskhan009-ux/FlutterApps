import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReadFile extends StatefulWidget {
  const ReadFile({super.key});

  @override
  State<ReadFile> createState() => _ReadFileState();
}

class _ReadFileState extends State<ReadFile> {
  TextEditingController nameController = TextEditingController();

  String? docId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Read FIle ")),
      body: Column(
        children: [
          // Text(selectedId ?? 'null'),
          //if (selectedId != null)
            Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Update name ',
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('student')
                        .doc(docId)
                        .update({'name': nameController.text});
                  },
                  child: Text('Update'),
                ),
              ],
            ),

          // StreamBuilder(
          //   stream: FirebaseFirestore.instance
          //       .collection('student')
          //       .snapshots(),
          //   builder: (context, snapshot) {
          //     if (!snapshot.hasData) { //snapshot.data==0
          //       return Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Center(child: CircularProgressIndicator()),
          //       );
          //     }
          //     final data = snapshot.data!.docs;
          //     return ListView.builder(
          //       shrinkWrap: true,
          //       itemCount: data.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         final name = data[index]['name'];
          //         final age = data[index]['age'];
          //         String id = data[index].id;
          //         return ListTile(
          //           leading: IconButton(
          //             onPressed: () {
          //               setState(() {
          //                 selectedId = id;
          //               });
          //             },
          //             icon: Icon(Icons.edit),
          //           ),
          //           title: Text(name),
          //           subtitle: Text('Age is $age'),
          //           trailing: IconButton(
          //             onPressed: () {
          //               FirebaseFirestore.instance
          //                   .collection('student')
          //                   .doc(id)
          //                   .delete();
          //             },
          //             icon: Icon(Icons.delete),
          //           ),
          //         );
          //       },
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
