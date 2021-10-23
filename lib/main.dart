import 'package:flutter/material.dart';
import 'package:recipe_app/custom_theme.dart';

import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe',
      theme: customLightTheme(context),
      darkTheme: customDarkTheme(context),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    );
  }
}
