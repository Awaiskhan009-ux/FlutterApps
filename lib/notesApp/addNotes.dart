import 'package:flutter/material.dart';
import 'package:flutter_application_1/NotesModel.dart';
import 'package:flutter_application_1/notesApp/NotesProvider.dart';
import 'package:provider/provider.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});
  

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController title =TextEditingController();
  TextEditingController desc=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add notes"),),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(spacing: 20, children: [
        
          TextField(controller: title,
          decoration: InputDecoration(hint: Text("Title")),),
          TextField(maxLines: 3, controller: desc,decoration: InputDecoration(hint: Text("Desc")),),
          
          
          ElevatedButton(onPressed: (){
                NotesModel note = NotesModel(title.text, desc.text);
            Provider.of<NotesProvider>(context,listen: false).addNotes(note);
            Navigator.pop(context);
          
          
          }, child: Text("Save"))
        ],),
      ),
    );
  }
}