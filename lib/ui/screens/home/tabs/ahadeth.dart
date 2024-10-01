import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadeth_model/hadeth_model.dart';
import 'package:islami/ui/utilise/extension.dart';
import 'package:islami/ui/widget/item_ahadeth_name.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme_provider.dart';
import '../../../utilise/app_assets.dart';
import '../../../utilise/app_colors.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  late ThemeProvider themeProvider;
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    if (ahadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Image.asset(AppAssets.ahdethTabLogo),
        buildDivider(),
        Text(
          context.localization.ahadethName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        buildDivider(),
        buildHadethList()
      ],
    );
  }

  Expanded buildHadethList() {
    return Expanded(
      child: ahadethList.isEmpty
          ? buildLoading()
          : ListView.separated(
              itemBuilder: (context, index) {
                return ItemAhadethName(hadeth: ahadethList[index]);
              },
              itemCount: ahadethList.length,
              separatorBuilder: (context, index) {
                return buildDivider();
              },
            ),
    );
  }

  Center buildLoading() => const Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryLight,
      ));

  Divider buildDivider() => Divider(
        color: themeProvider.isDarkThemeEnabled
            ? AppColors.accentDark
            : AppColors.primaryLight,
        thickness: 3,
      );

  void loadHadethFile() async {
    String hadethContent =
        await rootBundle.loadString("assets/files/ahadeth/ahadeth.txt");
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}
