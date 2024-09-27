import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/home_screen.dart';
import 'package:islami/ui/screens/sura_details_screen/sura_details_screen.dart';
import 'package:islami/ui/utilise/theme_data.dart';

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
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SuraDetailsScreen.routeName: (_) => const SuraDetailsScreen()
      },
      theme: MyThemeData.lightMode,
    );
  }
}
