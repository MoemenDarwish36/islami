import 'package:flutter/material.dart';

class ItemAhadethDetails extends StatelessWidget {
  String content;

  ItemAhadethDetails({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
