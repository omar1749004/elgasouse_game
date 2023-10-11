import 'package:el_gasous/data/models/player_models.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyServices extends GetxService
{
  late SharedPreferences sharedPreferences ;
  Future<MyServices> intial () async
  {
    sharedPreferences =await SharedPreferences.getInstance();
    return this;
  }
  
}
 
 
intialService() async
{
  await Get.putAsync(() => MyServices().intial());
}

class PlayersSave extends GetxController{
  List<PlayersModel>? playersList ;
  
 
}