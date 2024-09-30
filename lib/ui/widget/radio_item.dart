import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart ' hide Radio;

import '../../model/radio_model/radios.dart';
import '../utilise/app_colors.dart';

class RadioItem extends StatefulWidget {
  AudioPlayer player;
  Radios radio;

  RadioItem({super.key, required this.radio, required this.player});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        Text(
          widget.radio.name ?? "",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  await widget.player.play(UrlSource(widget.radio.url ?? ""));
                },
                icon: const Icon(
                  Icons.play_arrow,
                  color: AppColors.primaryLight,
                  size: 40,
                )),
            IconButton(
                onPressed: () async {
                  await widget.player.pause();
                },
                icon: const Icon(
                  Icons.stop,
                  color: AppColors.primaryLight,
                  size: 40,
                )),
          ],
        )
      ],
    );
  }
}
