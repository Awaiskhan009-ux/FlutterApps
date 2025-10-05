import 'package:flutter/material.dart';
import 'package:flutter_application_1/fav/favProvider.dart';
import 'package:http/retry.dart';
import 'package:provider/provider.dart';

class favScreen2 extends StatefulWidget {
  const favScreen2({super.key});

  @override
  State<favScreen2> createState() => _favScreen2State();
}

class _favScreen2State extends State<favScreen2> {
  List<int> selectedItem =[];
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(title: Text("Fav Screen"),),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Consumer<favProvider>(builder: (context,value,child){
               return ListTile(
                onTap: (){

                   if(value.slectedItem.contains(index)){
                   value.removeFav(index);
                   }
                   else{
value.addFav(index);
                   }
                },
                title: Text("title"+index.toString()),
                trailing: Icon(value.slectedItem.contains(index)?Icons.favorite:Icons.favorite_border_outlined,color: selectedItem.contains(index)?Colors.red:null),
              ) ;
              });
            },
          ),
        ),
      ],),
    );
  }
}