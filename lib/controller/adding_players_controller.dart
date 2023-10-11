import 'dart:math';

import 'package:el_gasous/core/constant/app_rout.dart';
import 'package:el_gasous/core/services/services.dart';
import 'package:el_gasous/data/models/player_models.dart';
import 'package:el_gasous/data/service/static/animal_list.dart';
import 'package:el_gasous/data/service/static/anime_list.dart';
import 'package:el_gasous/data/service/static/car_list.dart';
import 'package:el_gasous/data/service/static/clothes_list.dart';
import 'package:el_gasous/data/service/static/foode_list.dart';
import 'package:el_gasous/data/service/static/football_players.dart';
import 'package:el_gasous/data/service/static/job_list.dart';
import 'package:el_gasous/data/service/static/movies_list.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddingPlayersController extends GetxController {
  late int id;
  List<PlayersModel> playersList = [];
  late TextEditingController playername;
  String? playerJson;
  String? loadPlayer;
  int point = 0;
  bool canplay = false;
  bool isrepet = false;
  late String secretWord;
 late String  selectedPlayer ;
  ScrollController scrollController = ScrollController();
  MyServices myServices = Get.find();
final PlayersSave myController = Get.find();

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 69.0,
      duration:const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void addPlayers() {
    if (playername.text.isNotEmpty) {
      if (!playersList.any((player) => player.name == playername.text)) {
        if (playersList.length < 20) {
          playersList.add(PlayersModel(
              point: point, name: playername.text, color: geColorNumb()));
          playerJson = PlayersModel.encode(playersList);
          scrollToBottom();
          myServices.sharedPreferences.setString("playersList", playerJson!);
          playername.clear();
          Get.back();
        }
      } else {
        isrepet = true;
      }
    }
    update();
    
  }

  int geColorNumb() {
    int numb = 0;
    while (playersList.any((player) => player.color == numb)) {
      numb = Random().nextInt(20);
    }
    return numb;
  }

  loadPlayers() async {
    
    if(myController.playersList != null)
    {
     
      playersList = myController.playersList! ;
    }else{
     
      loadPlayer =  myServices.sharedPreferences.getString("playersList");
    if (loadPlayer?.isNotEmpty ?? true) {
     
      playersList = PlayersModel.decode(loadPlayer!);
      update();
    }
    }
    
  }
  
  void deletePlayers(String name) {
    playersList.removeWhere((element) => element.name == name);
    playerJson = PlayersModel.encode(playersList);
    myServices.sharedPreferences.setString("playersList", playerJson!);
    update();
  }

  String printAppBarText() {
    if (playersList.length < 3) {
      return "أضف على الأقل ثلاث لاعبين ثم اضغط التالي";
    } else if (playersList.length < 20) {
      return "تقدر تضيف لاعبين زيادة أو تبدأ اللعب بالضغط على التالي";
    } else {
      return "وصلت الحد الأقصى من اللاعبين اضغط التالي للّعب!";
    }
  }
  String getSecretWord(List<List<String>> selectedList){
    int randomCategoryIndex = Random().nextInt(selectedList.length); 
    int randomItemIndex = Random().nextInt(selectedList[randomCategoryIndex].length);
     return selectedList[randomCategoryIndex][randomItemIndex];
  }
  
  gotoplaye(){
   selectedPlayer = playersList[Random().nextInt(playersList.length)].name! ;
    myController.playersList = playersList ;
   playersList.shuffle();
   Get.offNamed(AppRout.showWordid, arguments: {
    "word" : secretWord ,
    "x" : selectedPlayer,
    "playersList" : playersList,
    "id" :id
   });
  
  }
  selectSecretWord(){
    if(id == 1){
      secretWord =getSecretWord(animalsList) ;
    }
    else if(id == 2){
     secretWord =  getSecretWord(foodList) ;
     
    }else if(id == 3)
    {
      secretWord = getSecretWord(footballPlayersList);
    }else if(id == 4)
    {
      secretWord = getSecretWord(carsList);
    }else if(id == 5)
    {
      secretWord = jobList[Random().nextInt(jobList.length)];
    }else if(id == 6)
    {
      secretWord = moviesList[Random().nextInt(moviesList.length)];
    }
    else if(id == 7)
    {
      secretWord = animeList[Random().nextInt(animeList.length)];
    }
    else if(id == 8)
    {
      secretWord = clothingList[Random().nextInt(clothingList.length)];
    }
    
  }
  @override
  void onInit() {
    loadPlayers();
    id = Get.arguments["id"];
    
    selectSecretWord();
    playername = TextEditingController();
    super.onInit();
  }
}
