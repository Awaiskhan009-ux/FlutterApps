import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/CounterProvider.dart';
import 'package:flutter_application_1/FireAuthLogin.dart';
import 'package:flutter_application_1/ImagePicker.dart';
import 'package:flutter_application_1/ImagePicker2.dart';
import 'package:flutter_application_1/LoginSc.dart';
import 'package:flutter_application_1/LoginScreenFire.dart';
import 'package:flutter_application_1/MainLogin.dart';
import 'package:flutter_application_1/PickPicker.dart';
import 'package:flutter_application_1/ReadFile.dart';
import 'package:flutter_application_1/RegisterFile.dart';
import 'package:flutter_application_1/Screen.dart';
import 'package:flutter_application_1/TaskReadFile.dart';
import 'package:flutter_application_1/Update&Delete.dart';
import 'package:flutter_application_1/counterHome.dart';
import 'package:flutter_application_1/creatFile.dart';
import 'package:flutter_application_1/fav/favProvider.dart';
import 'package:flutter_application_1/fav/favScreen.dart';
import 'package:flutter_application_1/fav/favScreen2.dart';
import 'package:flutter_application_1/firebaseCreate.dart';
import 'package:flutter_application_1/firebaseRead.dart';
import 'package:flutter_application_1/firebase_Screen.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/foodAppProject/onBoarding.dart';
import 'package:flutter_application_1/google_auth.dart';
import 'package:flutter_application_1/homeProvider.dart';
import 'package:flutter_application_1/homeScreen.dart';
import 'package:flutter_application_1/loginscreen.dart';
import 'package:flutter_application_1/new.dart';
import 'package:flutter_application_1/notesApp/NotesProvider.dart';
import 'package:flutter_application_1/notesApp/addNotes.dart';
import 'package:flutter_application_1/notesApp/notesApp.dart';
import 'package:flutter_application_1/screens/splashScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Cloudinary.fromCloudName(cloudName: 'db7wm7gg5');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>favProvider()),
    ],
    
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>SplashScreen(),
      
      
      },
    
      ),
    );
  }
}
