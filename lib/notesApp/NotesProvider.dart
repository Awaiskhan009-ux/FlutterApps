import 'package:flutter/material.dart';
import 'package:flutter_application_1/NotesModel.dart';

class NotesProvider with ChangeNotifier{
 
List<NotesModel> notes=[];

void addNotes(NotesModel note){

notes.add(note);
notifyListeners();
}
void deleteNotes(NotesModel note){
  notes.remove(note);
  notifyListeners();
}


}