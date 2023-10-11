import 'package:el_gasous/core/services/services.dart';
import 'package:el_gasous/data/models/player_models.dart';
import 'package:get/get.dart';

class ResultController extends GetxController{
 late List<PlayersModel> playersList;
final PlayersSave myController = Get.find();
 late int id  ;

 @override
  void onInit() {
    playersList = Get.arguments["playersList"];
     id =Get.arguments["id"];
    playersList.sort((a, b) => b.point.compareTo(a.point));
    myController.playersList = playersList ;

    super.onInit();
  }
}