import 'package:el_gasous/core/constant/app_theme.dart';

import 'package:el_gasous/core/services/services.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';


class LocalController extends GetxController
{
  Locale? language;
  ThemeData apptheme = themeEnglish;
  MyServices myServices =Get.find();

  changeLang(String languageCode)
  {
    Locale locale =Locale(languageCode);
    myServices.sharedPreferences.setString("lang", languageCode);
    apptheme =languageCode =="ar"? themeArabic:themeEnglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
  }
  
  
  @override
  void onInit() {
     
     
    //  requestPrimationNotification();
    String? sharedPrefLang =myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang == "ar")
    {
      language =const Locale("ar");
      apptheme =themeArabic;
    }
    else if(sharedPrefLang == "en")
    {
      language =const Locale("en");
      apptheme =themeEnglish;
    }else 
    {
      language =const Locale("ar");
    }
    super.onInit();
  }
}