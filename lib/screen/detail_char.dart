import 'package:flutter/material.dart';
import 'package:latihan_responsi/model/detail_characters.dart';
import 'package:latihan_responsi/model/model.dart';

class DetailChar extends StatelessWidget {
  String detailChar;
  DetailChar({super.key,
  required this.detailChar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('List ' + detailChar),),

        body: _buildDetailChar(),

    );
  }

  Widget _buildDetailChar(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadDetailCharacters(detailChar),  
        builder: (BuildContext context, AsyncSnapshot<dynamic>snapshot){
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          }else if (!snapshot.hasData){
            return Text("No data");
          }else{
            DetailCharacters data = DetailCharacters.fromJson(snapshot.data);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network('https://api.genshin.dev/characters/${detailChar}/gacha-splash'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network('https://api.genshin.dev/nations/${data.nation.toLowerCase()}/icon', width: 50, height: 50,),
                    Image.network('https://api.genshin.dev/elements/${data.vision.toLowerCase()}/icon', width: 50, height: 50,),
                    Text(data.name, style: TextStyle(
                      color: Colors.black, fontSize: 30,
                    ),),
                  ],
                ),
                _stars(data.rarity),
                Text(data.affiliation, style: TextStyle(color: Colors.black),),
                SizedBox(height: 30,),
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(data.description, style: TextStyle(color: Colors.black), textAlign: TextAlign.justify,),
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Image.network('https://api.genshin.dev/characters/${data.name}/talent-na',width: 80,height: 80),
                    Expanded(child: Text(data.skillTalents[0].description, textAlign: TextAlign.justify,))
                  ],
                )

              ],
            );
          }
        }
        
        ),
    );
  }

  Widget _stars(int number){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        number, 
          (index) => Icon(Icons.stars, color: Colors.white,)
      )
  
    );
  }

}