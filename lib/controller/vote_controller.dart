import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:el_gasous/core/constant/app_rout.dart';


import 'package:el_gasous/data/models/player_models.dart';
import 'package:get/get.dart';

class VoteController extends GetxController{
  late List<PlayersModel> playersList;
  late String selectPlayer ;
  late String word;
  late String votePlaye ;
  int counter = 0 ;
  bool isShow =false ;
  bool foucuse =false ;
  late int id ;
  Timer? timer;
  late String currentPlay ="";
  AudioPlayer audioPlayer = AudioPlayer();
      
  void selectPlayers(int i){
    
  if(playersList[i].name ==selectPlayer)
  { 
    
   playersList[counter].point += 100;
    
   
  }
  counter ++ ;
  if(counter < playersList.length){
   
    
    votePlaye = playersList[counter].name! ;
    
    update();
    
    
  }else{
  showGasouse();
   isShow =true ; 
   
   update();
  }
  }
  void showGasouse() async{
    
    // Start a timer to update the displayed index randomly every 1 second.
    timer = Timer.periodic(const Duration(milliseconds:100), (timer) {
       
        currentPlay =  playersList[Random().nextInt(playersList.length)].name!;
      
      update();
    });
      await audioPlayer.play(
            AssetSource('audio/mixkit-drum-roll-566.wav'));
    // After 2 seconds, stop the timer and display a specific element.
    Future.delayed(const Duration(milliseconds: 3500), () {
      timer?.cancel();
      audioPlayer.stop()
;        foucuse =true ;
        currentPlay = selectPlayer ; // Display a specific element (e.g., "Item 3")
       update();
    });
  }
  void gotoSelectWord(){
     
    Get.offNamed(AppRout.selectWordid,arguments: {
        "playersList": playersList ,
         "word" : word ,
          "x" : selectPlayer,
          "id": id ,
      });
  }
  @override
  void onInit() {
   playersList = Get.arguments["playersList"];
    selectPlayer = Get.arguments["x"];
    word = Get.arguments["word"];
    id = Get.arguments["id"];
    
    votePlaye = playersList[0].name! ;
    super.onInit();
  }
}