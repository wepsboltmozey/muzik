import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muzik_app/pages/Onilnepage/homePage.dart';
import 'package:muzik_app/pages/Onilnepage/mainpages/main_online_page.dart';
import 'package:muzik_app/pages/home_page.dart';
import 'package:muzik_app/pages/WelcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: "Muzik"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WelcomePage()  ;
  }
}
