import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  List<int> selectedItem=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fav"),),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              print(selectedItem.length);
              return ListTile(
                onTap: (){
                  
                  setState(() {
                    if(selectedItem.contains(index)){
                      selectedItem.remove(index);
                    }
                    else{
                      selectedItem.add(index);
                    }
                  });
                },
                title: Text("Item"+index.toString()),
              
                trailing: Icon(selectedItem.contains(index)?Icons.favorite:Icons.favorite_border_outlined,color: selectedItem.contains(index)?Colors.red:null),
                
              );
            },
          ),
        ),
      ],),
    );
  }
}