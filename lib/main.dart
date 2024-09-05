import 'package:flutter/material.dart';
import 'package:islami_app/screens/home_screen.dart';
import 'package:islami_app/style/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightModeStyle,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
