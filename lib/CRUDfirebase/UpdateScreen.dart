import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class UpdateScreen extends StatefulWidget {
  final String docId;
  final String currentName;
  const UpdateScreen({
    Key? Key,
    required this.docId,
    required this.currentName,
  });

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.currentName;
  }

  Widget build(BuildContext context) {
    //String? docId;
    // TextEditingController nameController=TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("update screen")),
      body: Column(
        children: [
          Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Update name',
                  border: OutlineInputBorder(),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('task')
                      .doc(widget.docId)
                      .update({'task': nameController.text});
                  Navigator.pop(context);
                },
                child: Text("update"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
