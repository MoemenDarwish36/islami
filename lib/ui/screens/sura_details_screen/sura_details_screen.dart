import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_model/sura_details_args.dart';
import 'package:islami/ui/widget/item_content.dart';

import '../../utilise/app_assets.dart';
import '../../utilise/app_colors.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "suraDetailsScreen";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late SuraDetailsArgs args;

  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(AppAssets.lightBackGround))),
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
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return buildDivider();
                    },
                    itemBuilder: (context, index) {
                      return ItemContent(
                        content: verses[index],
                        index: index,
                      );
                    },
                    itemCount: verses.length,
                  ),
                ),
        ));
  }

  Divider buildDivider() => const Divider(
        color: AppColors.primaryLight,
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
    // for (int i = 0; i < lines.length; i++) {
    //
    // }
    verses = lines;
    setState(() {});
  }
}
