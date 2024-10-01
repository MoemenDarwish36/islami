import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_model/sura_details_args.dart';
import 'package:islami/ui/widget/item_sura_details.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../utilise/app_colors.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "suraDetailsScreen";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late ThemeProvider themeProvider;

  late SuraDetailsArgs args;

  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(themeProvider.mainBackGround))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              args.suraName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: verses.isEmpty
              ? buildLoading()
              : Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .05,
                      vertical: MediaQuery.of(context).size.height * .06),
                  decoration: BoxDecoration(
                      color: themeProvider.isDarkThemeEnabled
                          ? AppColors.primaryDark
                          : AppColors.white,
                      // Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(24)),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return buildDivider();
                    },
                    itemBuilder: (context, index) {
                      return ItemSuraDetails(
                        content: verses[index],
                        index: index,
                      );
                    },
                    itemCount: verses.length,
                  ),
                ),
        ));
  }

  Divider buildDivider() => Divider(
        color: themeProvider.isDarkThemeEnabled
            ? AppColors.accentDark
            : AppColors.primaryLight,
        thickness: 3,
      );

  Center buildLoading() => const Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryLight,
      ));

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/quran/${index + 1}.txt');
    List<String> lines = content.split('\n');

    ///This function (where) to delete empty lines
    ///This function (trim) to delete any space in lines
    lines = lines.where((line) => line.trim().isNotEmpty).toList();

    verses = lines;
    setState(() {});
  }
}
