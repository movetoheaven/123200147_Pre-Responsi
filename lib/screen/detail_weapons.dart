import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:latihan_responsi/model/detail_weapons.dart';
import 'package:latihan_responsi/model/model.dart';

class DetailWeap extends StatelessWidget {
  String detailWeapons;
  DetailWeap({super.key,
  required this.detailWeapons
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$detailWeapons'),),
      body: _buildDetailWeapons(),
    );
  }

  Widget _buildDetailWeapons(){
    return Container(
        child: FutureBuilder(
          future: ApiDataSource.instance.loadDetailWeapons(detailWeapons),
          builder: (BuildContext context,AsyncSnapshot<dynamic>snapshot){
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            }else if(!snapshot.hasData){
              return Text("no data");
            }else{
              DetailWeapons weapons = DetailWeapons.fromJson(snapshot.data);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network("https://api.genshin.dev/weapons/${weapons}}/icon"),
                  )
                ],
              );

            }
          
          
          }
          ),
      );
  }


}