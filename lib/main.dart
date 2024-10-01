import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/ui/provider/language_provider.dart';
import 'package:islami/ui/screens/ahadeth_details_screen/ahadeth_details_screen.dart';
import 'package:islami/ui/screens/home/home_screen.dart';
import 'package:islami/ui/screens/sura_details_screen/sura_details_screen.dart';
import 'package:islami/ui/utilise/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => LanguageProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///to get object from Provider which i create
    LanguageProvider languageProvider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      ///this language which i support in my app
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],

      ///the language which i start run
      locale: Locale(languageProvider.selectedLanguage),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SuraDetailsScreen.routeName: (_) => const SuraDetailsScreen(),
        AhadethDetailsScreen.routeName: (_) => const AhadethDetailsScreen(),
      },
      theme: MyThemeData.lightMode,
    );
  }
}
