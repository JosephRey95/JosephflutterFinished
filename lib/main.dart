import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_project/Utils/Widget/item_list.dart';
import 'package:my_first_project/Views/principalMenu.dart';
import 'package:my_first_project/Views/register.dart';
import 'package:my_first_project/Views/view_more.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Views/login.dart';
import 'package:my_first_project/Utils/firebaseController.dart'
    as firebaseController;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case '/api':
            return MaterialPageRoute(
                builder: (context) => new NewsApi(setting.arguments));
          case '/login':
            return MaterialPageRoute(builder: (context) => new Login());
          case '/widget':
            return MaterialPageRoute(builder: (context) => new ItemList());
          case '/preview':
            return MaterialPageRoute(
                builder: (context) => new Preview(setting.arguments));
          case '/register':
            return MaterialPageRoute(builder: (context) => new RegisterUser());
          default:
            return null;
        }
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        this.context,
        MaterialPageRoute(builder: (context) => new Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Image.asset("assets/img/background.png"),
      ),
    );
  }
}
