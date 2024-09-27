import 'package:flutter/material.dart';
import 'package:islami/ui/widget/item_app.dart';

import '../../../utilise/app_assets.dart';
import '../../../utilise/app_colors.dart';
import '../../../utilise/constants.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // buildHeaderImage(),
        Image.asset(AppAssets.quranTabLogo),
        buildDivider(),
        Text(
          "Sura Name",
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
          return ItemApp(
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

  Divider buildDivider() => const Divider(
        color: AppColors.primaryLight,
        thickness: 3,
      );
}
