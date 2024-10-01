import 'package:flutter/material.dart';
import 'package:islami/ui/utilise/extension.dart';
import 'package:provider/provider.dart';

import '../../../provider/language_provider.dart';
import '../../../provider/theme_provider.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;

  bool isDarkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.localization.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 18,
          ),
          buildLanguageMenu(),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Text(context.localization.theme,
                  style: Theme.of(context).textTheme.bodyMedium),
              const Spacer(),
              buildThemeSwitch(),
            ],
          ),
        ],
      ),
    );
  }

  buildLanguageMenu() => DropdownButton(
      dropdownColor: Theme.of(context).primaryColor,

      /// to selected a default value i need to display
      /// this should to be a variable
      value: languageProvider.selectedLanguage,
      items: [
        DropdownMenuItem<String>(
            value: "ar",
            child: Text(
              context.localization.arabic,
              style: Theme.of(context).textTheme.bodySmall,
            )),
        DropdownMenuItem<String>(
            value: "en",
            child: Text(context.localization.english,
                style: Theme.of(context).textTheme.bodySmall)),
      ],

      /// this (isExpanded) to make arrow expanded
      isExpanded: true,

      ///this function(onChange) return dataType which i selected
      ///in DropdownMenuItem
      onChanged: (newLanguageCode) {
        ///this value maybe return null because user can open
        /// DropdownButton and close this without choice things
        languageProvider.newLanguage =
            newLanguageCode ?? languageProvider.selectedLanguage;

        setState(() {});
      });

  buildThemeSwitch() => Switch(

      ///this (value) is bool
      /// this should to be a variable
      value: themeProvider.isDarkThemeEnabled,

      ///this (onChanged) is bool
      onChanged: (newValue) {
        themeProvider.newTheme = newValue ? ThemeMode.dark : ThemeMode.light;
        setState(() {});
      });
}

