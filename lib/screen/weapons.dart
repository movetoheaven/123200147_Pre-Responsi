import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:latihan_responsi/screen/detail_weapons.dart';

import '../model/model.dart';

class WeaponsApp extends StatefulWidget {
  const WeaponsApp({super.key});

  @override
  State<WeaponsApp> createState() => _WeaponsAppState();
}

class _WeaponsAppState extends State<WeaponsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Weapons'),),
      body: _buildListWeaponsBody(),
    );
  }

  Widget _buildListWeaponsBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadWeapons(),
        builder: (BuildContext context, AsyncSnapshot<dynamic>snapshot){
         if(snapshot.data == null){
          return CircularProgressIndicator();
         } else if(!snapshot.hasData){
          return Text("No data");
         }else{
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              String name = snapshot.data[index];
              return Card(
              child: ListTile(
                leading: Image.network('https://api.genshin.dev/weapons/${snapshot.data[index]}/icon'),
                title: Text(snapshot.data[index]),
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=>DetailWeap(detailWeapons: snapshot.data[index]))

                  );
                },

              ),
            );
            },);
         }

        }
        ),
    );

  }


}