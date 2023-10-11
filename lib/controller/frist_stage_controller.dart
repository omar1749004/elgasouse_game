import 'dart:async';


import 'package:el_gasous/core/constant/app_rout.dart';
import 'package:el_gasous/data/models/player_models.dart';

import 'package:get/get.dart';

class FristStageController extends GetxController {
  int indexlpage = 0;
   int indexlist = 0 ;
  int counter = 0;
  double opacity = 0.0;
  late List<PlayersModel> playersList;
  late String selectPlayer;
  late String word;
  late String playerName;
  bool isvisble = true;
  bool timeAsk = false;
  bool lastask = false;
   String woring = "وقت الأسئلة";
  late int id ;
  late int max;
  late List<PlayersModel> randomList;
  
  Map<String, String> mapPlayer = {};
  List<List<String>> askPlayersList = [];
  printText() {
    max = playersList.length;
    if (indexlist <= playersList.length) {
      
    
       
      if (indexlpage == 0) {
        isvisble = true;
        update();
        return "ادي الموبايل ل $playerName دوس\n التالي علشان تعرف انت اللي بره\n ولا لا ومتوريش الموبايل  لحد";
      } else {
        isvisble = false;
        update();
        if (playerName != selectPlayer) {
          return "أنت جوا الموضوع اللي هوا \n $word\nهدفك في اللعبة تعرف مين اللي\n بره الموضوع.اضغط التالي";
        } else if (playerName == selectPlayer) {
          return "أنت اللي بره اللعبه حاول تعرف\n هما بيتكلمو عن اي وأقنعهم \n يصوتو على الشخص الخطأ!";
        }
      }
      update();
    }
  }

  creatAskplayersList() {
    randomList = List.from(playersList); 
    List<String> test;
    randomList.shuffle();
     
 
    for (int i = 0; i < randomList.length; i++) {
     
      if(i<randomList.length - 1)
      {
         
         test = [randomList[i].name!, randomList[i+1].name!];
         askPlayersList.add(test);
      }else{
         test = [randomList[i].name!, randomList[0].name!];
           askPlayersList.add(test);
      }
     
       }
        
    }

  

  printAsked() {
    if (indexlpage == 2) {
      playerName = "وقت الأسئلة";

      return "كل واحد هيسأل شخص تاني سؤال\nاضغك التالي علشان تعرف مين \nمين هيسأل مين";
    } else if (indexlpage - 3 < playersList.length) {
       playerName = "وقت الأسئلة";
      
      return "${askPlayersList[indexlpage - 3][0]} اسال ${askPlayersList[indexlpage - 3][1]} وحاول توقعة";
    } else if (indexlpage - 3 == playersList.length) {
      
      playerName = "وقت الأسئلة العشوائية";
      lastask = true;
      update();
      return "يقدر اي لاعب يسال شخص شالكك\n فيه بس بشرط كل لاعب يقدر\n يسال سؤالين بس";
    } else {
        
      Get.offNamed(AppRout.votePageid,arguments: {
        "playersList": playersList ,
         "word" : word ,
          "x" : selectPlayer,
          "id": id ,
      });
      return "";
    }
  }

  nextString() {
    counter++;
    if (counter < max * 2) {
      if (indexlpage == 1) {
        indexlist++;
        indexlpage = 0;
        
         playerName = playersList[indexlist].name!;
        
        update();

      } else {
        indexlpage++;
      }
    } else {
      indexlpage++;
      if (indexlpage == 2) {
        showContainer();
      }else if(indexlpage - 3 == playersList.length)
      {
        woring = "وقت الأسئلة العشوائية" ;
      showContainer() ;
      }
      printAsked();
      timeAsk = true;
    }
    update();
  }

  void showContainer() async {
    
    update();
    // Start a timer to hide the widget after 3 seconds.

    for (int i = 0; i <= 4; i++) {
      opacity += 0.2;
    }

    update();

    
    int i = 0;
    await Future.delayed(const Duration(milliseconds: 700));
    for (; i <= 4; i++) {
      opacity -= 0.2;
   update();
     
    }
    await Future.delayed(const Duration(seconds: 1));
    opacity = 0.0 ;
    update();

  }
  
  @override
  void onInit() {
    playersList = Get.arguments["playersList"];
    selectPlayer = Get.arguments["x"];
    word = Get.arguments["word"];
    id =Get.arguments["id"];
     playerName = playersList[0].name!;
     
    printText();
    
    
    
   creatAskplayersList();
    super.onInit();
  }

}
