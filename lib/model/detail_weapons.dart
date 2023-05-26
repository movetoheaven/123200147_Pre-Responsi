// To parse this JSON data, do
//
//     final detailWeapons = detailWeaponsFromJson(jsonString);

import 'dart:convert';

DetailWeapons detailWeaponsFromJson(String str) => DetailWeapons.fromJson(json.decode(str));

String detailWeaponsToJson(DetailWeapons data) => json.encode(data.toJson());

class DetailWeapons {
    String name;
    String type;
    int rarity;
    int baseAttack;
    String subStat;
    String passiveName;
    String passiveDesc;
    String location;
    String ascensionMaterial;

    DetailWeapons({
        required this.name,
        required this.type,
        required this.rarity,
        required this.baseAttack,
        required this.subStat,
        required this.passiveName,
        required this.passiveDesc,
        required this.location,
        required this.ascensionMaterial,
    });

    factory DetailWeapons.fromJson(Map<String, dynamic> json) => DetailWeapons(
        name: json["name"],
        type: json["type"],
        rarity: json["rarity"],
        baseAttack: json["baseAttack"],
        subStat: json["subStat"],
        passiveName: json["passiveName"],
        passiveDesc: json["passiveDesc"],
        location: json["location"],
        ascensionMaterial: json["ascensionMaterial"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "rarity": rarity,
        "baseAttack": baseAttack,
        "subStat": subStat,
        "passiveName": passiveName,
        "passiveDesc": passiveDesc,
        "location": location,
        "ascensionMaterial": ascensionMaterial,
    };
}
