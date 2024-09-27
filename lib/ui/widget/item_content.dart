import 'package:flutter/material.dart';

class ItemContent extends StatelessWidget {
  String content;

  int index;

  ItemContent({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$content(${index + 1})",
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
