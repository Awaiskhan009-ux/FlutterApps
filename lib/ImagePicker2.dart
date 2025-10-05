import 'dart:io';

import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicker2 extends StatefulWidget {
  const ImagePicker2({super.key});

  @override
  State<ImagePicker2> createState() => _ImagePicker2State();
}

class _ImagePicker2State extends State<ImagePicker2> {
File? image;
Uint8List? photo;
Future<void> pickImage() async{
  final PickedFile= await ImagePicker().pickImage(source: ImageSource.gallery);
  if(kIsWeb){
    photo=await PickedFile!.readAsBytes();
  }
  if(PickedFile!=null){
    image=File(PickedFile.path);
    setState(() {
      
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image picker"),),
      body: Column(children: [
Container(width: 200,height: 300, color: Colors.amber,child: image!=null? Image.file(image!):Center(child: Text("no image found"),),),
      ],),
    );
  }
}