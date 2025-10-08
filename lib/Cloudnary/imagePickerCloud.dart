import 'dart:io';

import 'dart:typed_data';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCloud extends StatefulWidget {
  const ImagePickerCloud({super.key});

  @override
  State<ImagePickerCloud> createState() => _ImagePickerCloudState();
}

class _ImagePickerCloudState extends State<ImagePickerCloud> {

  File? image;

  Uint8List? photo;

  Future<void> pickerImage() async {
    final pickerFile = await ImagePicker().pickImage(
      source:  ImageSource.gallery,
    );
    if(kIsWeb){
      photo =  await pickerFile!.readAsBytes();
    }

    // Anroid

    if(pickerFile!=null){
      image=File(pickerFile.path);
      setState(() {
        
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Image picker"),),
      body: Column(children: [
        Center(child: Container(
          width: 200, height: 400,
          color: Colors.amber,
          child: image !=null
          ? Image.file(image!):Center(child: Text("no image found"),),
        ),)

      ],),
    );
  }
}