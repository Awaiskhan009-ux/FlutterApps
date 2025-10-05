import 'package:flutter/material.dart';
import 'package:flutter_application_1/NotesModel.dart';
import 'package:flutter_application_1/notesApp/NotesProvider.dart';
import 'package:flutter_application_1/notesApp/addNotes.dart';
import 'package:provider/provider.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Notes"),centerTitle: true,),
      body: Consumer<NotesProvider>(
        builder: (context,Provider,child) {
          return ListView(
            children: [
              for (NotesModel note in Provider.notes)
              ListTile(
                title: Text(note.title),
                subtitle: Text(note.desc),
                trailing: IconButton(onPressed: (){
                  Provider.deleteNotes(note);
                }, icon: Icon(Icons.delete)),
              )
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNotes()));

      
        
      },child: Icon(Icons.add) ),
    );

}}