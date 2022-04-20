import 'dart:async';

import 'package:android_clock/controllers/home_controller.dart';
import 'package:android_clock/services/theme_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Get.find<HomeController>();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getWeather(region: controller.region.value);
    Timer.periodic(const Duration(seconds: 1), (timer) async{
      var now = await NTP.now();
      controller.time.value = DateFormat('HH:mm').format(now);
      controller.day.value = now.day.toString();
      controller.month.value = DateFormat.MMMM().format(now).toString();
      controller.week.value = DateFormat('EEEE').format(now).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetX<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text('Clock and Weather'),
          centerTitle: true,
          actions: [
            PopupMenuButton(
                icon: const Icon(Icons.menu),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                      if(Get.isDarkMode) {
                        Get.changeThemeMode(ThemeMode.dark);
                        ThemeService().switchTheme();
                      }
                    },
                    child: const Text('Dark mode'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      if(!Get.isDarkMode){
                        Get.changeThemeMode(ThemeMode.light);
                        ThemeService().switchTheme();
                      }
                    },
                    child: const Text('Light mode'),
                  ),
                  controller.popup(value: controller.region.value, location: 'tashkent'),
                  controller.popup(value: controller.region.value, location: 'andijan'),
                  controller.popup(value: controller.region.value, location: 'bukhara'),
                  controller.popup(value: controller.region.value, location: 'gulistan'),
                  controller.popup(value: controller.region.value, location: 'jizzakh'),
                  controller.popup(value: controller.region.value, location: 'qarshi'),
                  controller.popup(value: controller.region.value, location: 'navoiy'),
                  controller.popup(value: controller.region.value, location: 'namangan'),
                  controller.popup(value: controller.region.value, location: 'nukus'),
                  controller.popup(value: controller.region.value, location: 'samarkand'),
                  controller.popup(value: controller.region.value, location: 'termez'),
                  controller.popup(value: controller.region.value, location: 'urgench'),
                  controller.popup(value: controller.region.value, location: 'fergana'),

                ]
            ),
          ],
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: !controller.isLoading() ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Get.isDarkMode ? const AssetImage('assets/images/background.png') : const AssetImage('assets/images/background_light.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: height * 0.1),
                        height: height * 0.5,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2, color: Colors.indigoAccent),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset('assets/images/gerb.png', height: height * 0.22, fit: BoxFit.cover,),
                    ),

                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: height * 0.22),
                      child: Column(
                        children: [
                          Text(controller.time.value, style: TextStyle(color: !Get.isDarkMode ? Colors.white : Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 85),),

                          Text('${controller.day.value}  ${controller.month.value}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 45),),

                          Text(controller.week.value, style: const TextStyle(fontSize: 45),),
                        ],
                      ),
                    ),

                  ],
                ),

                SizedBox(height: height * 0.03,),

                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Image.asset('assets/images/${controller.weatherCode.value}.png', height: 100, width: 100,)
                          )
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.temp.value.toInt() > 0 ? "+${controller.temp.value.toInt().toString()}" : "-${controller.temp.value.toInt().toString()}",
                                    style: const TextStyle(fontSize: 80, fontWeight: FontWeight.w300),),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 3, color: Theme.of(context).canvasColor),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text("${controller.region.value[0].toUpperCase()}${controller.region.value.substring(1).toLowerCase()}", style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w300),)
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ) : const Center(child: CircularProgressIndicator(),),
        ),
      ),
    );
  }
}
