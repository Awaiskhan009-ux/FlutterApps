import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/CounterProvider.dart';
import 'package:flutter_application_1/homeProvider.dart';
import 'package:provider/provider.dart';

class CounterHome extends StatefulWidget {
  const CounterHome({super.key});

  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider"),centerTitle: true,),
      body: 
      
      
      Center(child: Consumer<CounterProvider>(builder: (context,provider,child){
     
        
        return Text(provider.count.toString(),style: TextStyle(fontSize: 50),);
      }),),
   
      floatingActionButton: FloatingActionButton(onPressed: (){
      
    
Provider.of<CounterProvider>(context,listen: false).increment();


      },child: Icon(Icons.add),),
      

    
    );
  }
}