import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/ahadeth.dart';
import 'package:islami/ui/screens/home/tabs/quran.dart';
import 'package:islami/ui/screens/home/tabs/radio.dart';
import 'package:islami/ui/screens/home/tabs/sebha.dart';
import 'package:islami/ui/screens/home/tabs/settings.dart';
import 'package:islami/ui/utilise/app_assets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;
  List<Widget> tabs = [
    const QuranTab(),
    AhadethTab(),
    RadioTab(),
    const SebhaTab(),
    const SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.lightBackGround))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Islami",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        bottomNavigationBar: buildBottomNavigation(),
        body: tabs[selectedTabIndex],
      ),
    );
  }

  buildBottomNavigation() {
    return Theme(
      data: Theme.of(context)
          .copyWith(canvasColor: Theme.of(context).primaryColor),
      child: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: (index) {
            selectedTabIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icQuran)), label: "Quran"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icAhdeth)),
                label: "Ahadeth"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: "Radio"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: "Sebha"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
    );
  }
}
