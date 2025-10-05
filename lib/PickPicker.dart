import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class PicPickerFile extends StatefulWidget {
  const PicPickerFile({super.key});

  @override
  State<PicPickerFile> createState() => _PicPickerFileState();
}

class _PicPickerFileState extends State<PicPickerFile> {

  File? image;
  Uint8List? photo;

  Future <void> pickImage()async{
    final PickedFile= await ImagePicker().pickImage(
      source: ImageSource.gallery,

    );
//web 

if(kIsWeb){
  photo=await PickedFile!.readAsBytes();
}
//android

if(PickedFile!=null){
  image=File(PickedFile.path);
  setState(() {
    
  });

}

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Picker picker"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(child: GestureDetector(
          onTap: (){
            pickImage();
          },
          child: Container(width: 150,height: 300,color: Colors.amber,child: image !=null
          ? Image.file(image!):Center(child: Text("no image selected")),),)),
      ],),
    );
  }
}