import 'package:flutter/material.dart';
import 'package:islami/ui/utilise/extension.dart';
import 'package:islami/ui/widget/item_Sura_name.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme_provider.dart';
import '../../../utilise/app_assets.dart';
import '../../../utilise/app_colors.dart';
import '../../../utilise/constants.dart';

class QuranTab extends StatelessWidget {
  late ThemeProvider themeProvider;

  QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Column(
      children: [
        Image.asset(AppAssets.quranTabLogo),
        buildDivider(),
        Text(
          context.localization.suraName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        buildDivider(),
        buildSuraList()
      ],
    );
  }

  Expanded buildSuraList() {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ItemSuraName(
            name: Constants.suraNames[index],
            index: index,
          );
        },
        itemCount: Constants.suraNames.length,
        separatorBuilder: (context, index) {
          return buildDivider();
        },
      ),
    );
  }

  Divider buildDivider() => Divider(
        color: themeProvider.isDarkThemeEnabled
            ? AppColors.accentDark
            : AppColors.primaryLight,
        thickness: 3,
      );
}
