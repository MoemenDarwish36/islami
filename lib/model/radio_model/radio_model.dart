import 'package:islami/model/radio_model/radios.dart';

class RadioModel {
  RadioModel({
    this.radios,
  });

  RadioModel.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios?.add(Radios.fromJson(v));
      });
    }
  }

  List<Radios>? radios;

  RadioModel copyWith({
    List<Radios>? radios,
  }) =>
      RadioModel(
        radios: radios ?? this.radios,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (radios != null) {
      map['radios'] = radios?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
