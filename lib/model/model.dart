
import 'package:latihan_responsi/service/basenetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<List<dynamic>> loadCharacters(){
    return BaseNetwork.getList("characters");
  }

  Future<Map<String, dynamic>> loadDetailCharacters(String nama_karakter){
    return BaseNetwork.get("characters/${nama_karakter}");
  }


  Future<List<dynamic>> loadWeapons(){
    return BaseNetwork.getList("weapons");
  }
  
  Future<Map<String, dynamic>> loadDetailWeapons(String nama_weapons){
    return BaseNetwork.get("weapons/${nama_weapons}");
  }



}