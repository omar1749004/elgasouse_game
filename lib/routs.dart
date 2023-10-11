import 'package:el_gasous/core/constant/app_rout.dart';
import 'package:el_gasous/views/screen/adding_players.dart';
import 'package:el_gasous/views/screen/home_page.dart';
import 'package:el_gasous/views/screen/onboarding.dart';
import 'package:el_gasous/views/screen/result_page.dart';
import 'package:el_gasous/views/screen/select_word.dart';
import 'package:el_gasous/views/screen/first_stage.dart';
import 'package:el_gasous/views/screen/vote_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> routes =[

  GetPage(name: AppRout.homeid, page: ()=>const   HomePage()),
  GetPage(name: AppRout.onbourdingid, page: ()=> const OnBourding()),
  GetPage(name: AppRout.addingPlayersid, page: ()=> const AddingPlayers()),
  GetPage(name: AppRout.showWordid, page: ()=> const FristStage()),
  GetPage(name: AppRout.votePageid, page: ()=> const VotePage()),
  GetPage(name: AppRout.selectWordid, page: ()=> const SelectWord()),
   GetPage(name: AppRout.resultid, page: ()=> const ResultPage()),
] ;