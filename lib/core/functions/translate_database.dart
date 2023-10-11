import 'package:el_gasous/core/services/services.dart';
import 'package:get/get.dart';

String translateDataBase(String columnAr ,String columnEn)
{
  MyServices myServices =Get.find();
  if(myServices.sharedPreferences.getString("lang") =="ar")
  {
     return columnAr;
  }else {
    return columnEn;
  }
}