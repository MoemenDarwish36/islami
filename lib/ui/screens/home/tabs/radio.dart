import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../model/radio_model/radio_model.dart';
import '../../../../model/radio_model/radios.dart';
import '../../../utilise/app_assets.dart';
import '../../../widget/radio_item.dart';

class RadioTab extends StatelessWidget {
  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRadios(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<Radios> radios = snapShot.data?.radios ?? [];
            return Column(
              children: [
                Expanded(child: Image.asset(AppAssets.bodyOfRadio)),
                Expanded(
                    child: ListView.builder(
                  /// to swears screens lonely
                  physics: const PageScrollPhysics(),

                  /// to display widget horizontal
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: RadioItem(player: player, radio: radios[index])),
                  itemCount: radios.length,
                ))
              ],
            );
          } else if (snapShot.hasError) {
            return const Center(
              child: Text("Failed to load Radios"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<RadioModel?> getRadios() async {
    var uri = Uri.parse("https://mp3quran.net/api/v3/radios");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return RadioModel.fromJson(json);
    }
  }
}
