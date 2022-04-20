import 'package:android_clock/pages/home_page.dart';
import 'package:android_clock/pages/tablet_page.dart';
import 'package:flutter/material.dart';

class Options{
  static Widget getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    return data.size.shortestSide < 600 ? const HomePage() : const TabletPage();
  }
}