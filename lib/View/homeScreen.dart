import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homeProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provider"),
        centerTitle: true,
      ),
      body: Center(child: Consumer<HomeProvider>(builder: (context,provider,child) {
        return
        Text(provider.count.toString(),style: Theme.of(context).textTheme.displayLarge,);
      })),
      floatingActionButton: FloatingActionButton(onPressed: (){

        Provider.of<HomeProvider>(context,listen: false).increment();
      },child: Icon(Icons.add),),
    );
  }
}