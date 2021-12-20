import 'package:flutter/material.dart';
import 'package:flutter_animated_fab_menu/app/home_page.dart';
import 'package:flutter_animated_fab_menu/app/screens/add_screen.dart';
import 'package:flutter_animated_fab_menu/app/screens/camera_screen.dart';
import 'package:flutter_animated_fab_menu/app/screens/contact_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: "/homePage",
      routes: {
        "/homePage": (context) => HomePage(),
        "/add": (context) => AddScreen(
              title: 'Um simples contador',
            ),
        "/camera": (context) => CameraScreen(),
        "/contact": (context) => ContactScreen(),
      },
    );
  }
}
