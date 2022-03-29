
import 'package:e_commerce_app_demo/routes.dart';
import 'package:e_commerce_app_demo/screens/splash/splash_screen.dart';

import 'package:flutter/material.dart';

import 'components/theme_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp(),
      initialRoute: SplashScreen.routeName,
      routes: route
    );
  }
}