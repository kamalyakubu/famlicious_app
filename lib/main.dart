import 'package:famlicious_app/views/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const MyApp(),
      // ),
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Famlicious',
      theme: ThemeData(
          scaffoldBackgroundColor:const Color.fromRGBO(249, 251, 252, 1),
          cardColor: Colors.white,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              actionsIconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),),),
      darkTheme: ThemeData(
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.grey)),
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey.shade900,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          // actionsIconTheme: IconThemeData(
          //   color: Colors.white
          // ),

          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    );
  }
}
