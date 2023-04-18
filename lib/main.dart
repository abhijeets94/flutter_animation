import 'package:flutter/material.dart';
import 'package:flutter_animation/Routes/app_routes.dart';
import 'package:flutter_animation/Screens/home_screen.dart';
import 'package:flutter_animation/utils/dark_theme_style.dart';

void main(List<String> args) {
  runApp(const PortFolioApp());
}

class PortFolioApp extends StatelessWidget {
  const PortFolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Styles.themeData(true, context),
      home: HomeScreen(),
      onGenerateRoute: appRoute,
    );
  }
}
