import 'dart:math';


import 'package:audioplayers/audioplayers.dart';
import 'package:el_gasous/core/constant/app_rout.dart';
import 'package:el_gasous/core/constant/color.dart';
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

class SelectWordController extends GetxController {
  late String selectPlayer;
  late String word;
  late int id;
  List<String> wordList = [];
  late int randomIndex;
  List randomList = [];
  List<Color> colotList = [];
  late List<PlayersModel> playersList;
  bool isChouse = false;
  int catindex = 0;
  int wordIndex = 0;
  AudioPlayer audioPlayer = AudioPlayer();

  fillcolor() {
    for (int i = 0; i < 7; i++) {
      colotList.add(ColorApp.kPrimaryColor);
    }
  }

  selectCarList() {
    if (id == 1) {
      return animalsList;
    } else if (id == 2) {
      return foodList;
    } else if (id == 3) {
      return footballPlayersList;
    } else if (id == 4) {
      return carsList;
    } else if (id == 5) {
      return jobList;
    } else if (id == 6) {
      return moviesList;
    } else if (id == 7) {
      return animeList;
    } else if (id == 8) {
      return clothingList;
    }
  }

  void selectWord() {
    randomIndex = Random().nextInt(6);
    int i = 0;
    int j = 0;
    int x = 0;
    int y = 0;
    getIndexofCat();
    if (id == 1 || id == 2 || id == 3 || id == 4) {
      while (wordList.length < 7) {
        if (i == randomIndex) {
          if (!wordList.contains(selectCarList()[catindex][x])) {
            wordList.add(word);
            i++;
          }
        } else {
          while (j < 2) {
            x = Random().nextInt(selectCarList()[catindex].length);
            if (!wordList.contains(selectCarList()[catindex][x])) {
              wordList.add(selectCarList()[catindex][x]);

              i++;
              j++;
              break;
            } else {
              if (y < 2) {
                x = Random().nextInt(selectCarList().length);
                wordIndex = Random().nextInt(selectCarList()[x].length);
                if (!wordList.contains(selectCarList()[x][wordIndex])) {
                  wordList.add(selectCarList()[x][wordIndex]);
                  y++;
                  break;
                }
                break;
              }
              break;
            }
          }
          x = Random().nextInt(selectCarList().length);
          wordIndex = Random().nextInt(selectCarList()[x].length);
          if (!wordList.contains(selectCarList()[x][wordIndex])) {
            wordList.add(selectCarList()[x][wordIndex]);
            i++;
          }
        }
      }
    } else {
      randomList = List.from(selectCarList());
      randomList.shuffle();

      while (wordList.length < 7) {
        if (i == randomIndex) {
          wordList.add(word);
          i++;
        } else {
          if (!wordList.contains(selectCarList()[i])) {
            wordList.add(selectCarList()[i]);
            i++;
          }
        }
      }
    }
  }

  void checkChouse(String chouse, int i) async {
    if (!isChouse) {
      if (chouse == word) {
        await audioPlayer.play(
            AssetSource('audio/mixkit-correct-positive-notification-957.wav'));
        colotList[i] = Colors.green;

        isChouse = true;
        playersList[playersList.indexWhere((item) => item.name == selectPlayer)]
            .point += 100;
      } else {
        await AudioPlayer().play(AssetSource('audio/negative_beeps-6008.mp3'));
        colotList[i] = Colors.red;
        colotList[randomIndex] = Colors.green;

        isChouse = true;
      }

      update();
      await Future.delayed(const Duration(seconds: 2));
      Get.offNamed(AppRout.resultid,
          arguments: {"playersList": playersList, "id": id});
    }
  }

  void getIndexofCat() {
    randomList = selectCarList();
    for (int i = 0; i < randomList.length; i++) {
      for (int j = 0; j < randomList[i].length; j++) {
        if (randomList[i][j] == word) {
          catindex = i;

          break;
        }
      }
    }
  }

  @override
  void onInit() {
    fillcolor();
    selectPlayer = Get.arguments["x"];
    word = Get.arguments["word"];
    id = Get.arguments["id"];
    playersList = Get.arguments["playersList"];
    selectWord();
    super.onInit();
  }
}
