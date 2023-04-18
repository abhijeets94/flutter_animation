import 'package:flutter/material.dart';
import '../utils/files.dart';

Route<dynamic> appRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
      }
    default:
      {
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
      }
  }
}
