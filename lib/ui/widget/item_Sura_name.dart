import 'package:flutter/material.dart';
import 'package:islami/model/sura_model/sura_details_args.dart';
import 'package:islami/ui/screens/sura_details_screen/sura_details_screen.dart';

class ItemSuraName extends StatelessWidget {
  String name;
  int index;

  ItemSuraName({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(index: index, suraName: name));
      },
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
