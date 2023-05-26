import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:latihan_responsi/screen/character.dart';
import 'package:latihan_responsi/screen/weapons.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 40)
              ),
              onPressed: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => CharactersApp())
                );

            }, child: Text("Characters")),

            SizedBox(height: 20,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 40)
              ),
              onPressed: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => WeaponsApp())
                );

            }, child: Text("Weapon")),
            SizedBox(height: 50,)
          ],
        ),
        decoration: BoxDecoration(
          image:  DecorationImage(
            image: NetworkImage(
              'https://4.bp.blogspot.com/-iz7Z_jLPL6E/XQ8eHVZTlnI/AAAAAAAAHtA/rDn9sYH174ovD4rbxsC8RSBeanFvfy75QCKgBGAs/w1440-h2560-c/genshin-impact-characters-uhdpaper.com-4K-2.jpg'
            ),
            fit: BoxFit.cover
          )

        ),
      ),
    );
  }
}