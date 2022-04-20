import 'dart:developer';

import 'package:android_clock/models/Weather.dart';
import 'package:android_clock/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
    var time = DateTime.now().toString().obs;
    var day = DateTime.now().toString().obs;
    var month = DateTime.now().toString().obs;
    var week = DateTime.now().toString().obs;

    var temp = 0.obs;
    var weatherCode = ''.obs;
    var isLoading = false.obs;
    var region = 'tashkent'.obs;

    Future<void> getWeather({required region}) async{
        isLoading.value = true;

        Network.GET(Network.API_GET, Network.paramsGet(region: region)).then((value) {
            if(value != null) {
                temp.value =  weatherFromJson(value).airT!.toInt();
                weatherCode.value = weatherFromJson(value).weatherCode!;
            }
            isLoading.value = false;
        });
    }

    PopupMenuItem popup ({required value, required location}) {
        return PopupMenuItem(
            onTap: () {
                if(value != location){
                    region.value = location;
                    getWeather(region: value);
                }
            },
            child: Text(location),
        );
    }
}