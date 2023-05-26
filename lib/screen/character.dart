import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:latihan_responsi/model/model.dart';
import 'package:latihan_responsi/screen/detail_char.dart';

class CharactersApp extends StatefulWidget {
  const CharactersApp({super.key});

  @override
  State<CharactersApp> createState() => _CharactersAppState();
}

class _CharactersAppState extends State<CharactersApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Karakter'),),

      body: _buildListCharactersBody(),

    );
  }

  Widget _buildListCharactersBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadCharacters(),
        builder: (BuildContext context, AsyncSnapshot<dynamic>snapshot){
         if(snapshot.data == null){
          return CircularProgressIndicator();
         } else if(!snapshot.hasData){
          return Text("No data");
         }else{
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card(
              child: ListTile(
                leading: Image.network('https://api.genshin.dev/characters/${snapshot.data[index]}/icon'),
                title: Text(snapshot.data[index]),
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> DetailChar(detailChar: snapshot.data[index],))

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