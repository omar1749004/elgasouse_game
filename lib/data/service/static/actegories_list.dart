import 'package:el_gasous/core/constant/image_asset.dart';
import 'package:el_gasous/data/models/caterories_model.dart';
import 'package:flutter/material.dart';

List<CategoeiesModel> categoeiesList =[
  CategoeiesModel(name: "حيوانات", image: ImageAsset.animals, color: Colors.green,
  id: 1
  ),
  CategoeiesModel(name: "أكلات مصرية", image: ImageAsset.food, color: Colors.red,
  id: 2),
  CategoeiesModel(name: "لاعبين", image: ImageAsset.player, color:const Color.fromARGB(255, 38, 83, 161),
  id: 3),
  
  CategoeiesModel(name: "عربيات", image: ImageAsset.cars, color:const Color.fromARGB(255, 76, 71, 171),
  id: 4),
  CategoeiesModel(name: "وظائف", image: ImageAsset.jobs, color:const Color.fromARGB(255, 115, 22, 154),
  id: 5),
  CategoeiesModel(name: "أفلام", image: ImageAsset.movies, color:const Color.fromARGB(255, 50, 81, 235),
  id: 6),
  CategoeiesModel(name: "أنمي", image: ImageAsset.anime, color:const Color.fromARGB(255, 148, 58, 126),
  id: 7),

  CategoeiesModel(name: "ملابس", image: ImageAsset.cloths, color: Colors.blue,
  id: 8),

] ;