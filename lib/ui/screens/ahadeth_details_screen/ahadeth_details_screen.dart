import 'package:flutter/material.dart';
import 'package:islami/model/hadeth_model/hadeth_model.dart';
import 'package:islami/ui/widget/item_ahadeth_details.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../utilise/app_colors.dart';

class AhadethDetailsScreen extends StatefulWidget {
  static const String routeName = "ahadethDetailsScreen";

  const AhadethDetailsScreen({super.key});

  @override
  State<AhadethDetailsScreen> createState() => _AhadethDetailsScreenState();
}

class _AhadethDetailsScreenState extends State<AhadethDetailsScreen> {
  late ThemeProvider themeProvider;
  late Hadeth args;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(themeProvider.mainBackGround))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .05,
                vertical: MediaQuery.of(context).size.height * .06),
            decoration: BoxDecoration(
                color: themeProvider.isDarkThemeEnabled
                    ? AppColors.primaryDark
                    : AppColors.white,
                borderRadius: BorderRadius.circular(24)),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemAhadethDetails(
                  content: args.content[index],
                );
              },
              itemCount: args.content.length,
            ),
          ),
        ));
  }

  Divider buildDivider() => const Divider(
        color: AppColors.primaryLight,
        thickness: 3,
      );
}
