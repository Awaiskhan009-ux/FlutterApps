import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ImagePickerFile extends StatefulWidget {
  const ImagePickerFile({super.key});

  @override
  State<ImagePickerFile> createState() => _ImagePickerFileState();
}

class _ImagePickerFileState extends State<ImagePickerFile> {
  File? image;

  Uint8List? photo;
  Future<void> pickerImage() async {
    final pickerFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (kIsWeb) {
      photo = await pickerFile!.readAsBytes();
    }

    // Android
    if (pickerFile != null) {
      image = File(pickerFile.path);
      setState(() {});
    }
  }

  String uploadImage = '';

  Future<void> uploadImages() async {
    try {
      // Convert signature to image (Uint8List format).
      final img = await image!.readAsBytes();
      if (img == null) {
        throw Exception("No image picked");
      }

      // Convert Uint8List to a file-like structure for upload.
      final url = Uri.parse("https://api.cloudinary.com/v1_1/db7wm7gg5/upload");

      // Create the request.
      final request = http.MultipartRequest('POST', url);

      // Add fields for Cloudinary.
      request.fields['upload_preset'] = 'upload-image';

      // Add the image as a file.
      request.files.add(
        http.MultipartFile.fromBytes('file', img, filename: 'image.png'),
      );

      // Send the request.
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseString = await response.stream.bytesToString();
        final jsonMap = json.decode(responseString);

        setState(() {
          uploadImage = jsonMap['secure_url'];
        });
        print("Signature uploaded successfully: $uploadImage");
      } else {
        print("Failed to upload signature: ${response.statusCode}");
      }
    } catch (e) {
      print("Error uploading signature: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ImagePicker")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                pickerImage();
              },
              child: Container(
                width: 200,
                height: 300,
                color: Colors.blue,
                child: image != null
                    ? Image.file(image!)
                    : Center(child: Text("No image found")),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              await uploadImages();
            },
            child: Text('Upload Image'),
          ),
          // CircleAvatar(
          //   radius: 25,
          //   backgroundImage: NetworkImage('https://res.cloudinary.com/db7wm7gg5/image/upload/v1753096881/trvslntjm5kgtvp5ubi7.jpg'),
          // ),
        ],
      ),
    );
  }
}
