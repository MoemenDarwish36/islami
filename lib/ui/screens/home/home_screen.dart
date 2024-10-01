import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/ahadeth.dart';
import 'package:islami/ui/screens/home/tabs/quran.dart';
import 'package:islami/ui/screens/home/tabs/radio.dart';
import 'package:islami/ui/screens/home/tabs/sebha.dart';
import 'package:islami/ui/screens/home/tabs/settings.dart';
import 'package:islami/ui/utilise/app_assets.dart';
import 'package:islami/ui/utilise/extension.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeProvider themeProvider;
  int selectedTabIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    RadioTab(),
    const SebhaTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(themeProvider.mainBackGround))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.localization.islami,
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
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppAssets.icQuran)),
                label: context.localization.quran),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppAssets.icAhdeth)),
                label: context.localization.ahadeth),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppAssets.icRadio)),
                label: context.localization.radio),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppAssets.icSebha)),
                label: context.localization.sebha),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: context.localization.settings),
          ]),
    );
  }
}
