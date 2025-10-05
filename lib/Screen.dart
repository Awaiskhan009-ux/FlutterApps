import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScreenFile extends StatefulWidget {
  const ScreenFile({super.key});

  @override
  State<ScreenFile> createState() => _ScreenFileState();
}

class _ScreenFileState extends State<ScreenFile> {
  // Android
  File? image;

  // Web
  Uint8List? photo;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    //web
    if (kIsWeb) {
      photo = await pickedFile!.readAsBytes();
    }

    // Android
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App bar")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                pickImage();
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.amber,
                child: image != null
                    ? Image.file(image!)
                    : Center(child: Text('No Image Selected')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
