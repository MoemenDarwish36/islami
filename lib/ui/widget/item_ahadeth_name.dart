import 'package:flutter/material.dart';
import 'package:islami/model/hadeth_model/hadeth_model.dart';

import '../screens/ahadeth_details_screen/ahadeth_details_screen.dart';

class ItemAhadethName extends StatelessWidget {
  Hadeth hadeth;

  ItemAhadethName({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AhadethDetailsScreen.routeName,
            arguments: hadeth);
      },
      child: Text(
        hadeth.title,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
