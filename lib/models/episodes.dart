//Flutter
import 'package:flutter/material.dart';

//Utils
import 'package:rick_and_morty_app/utils/color_palette.dart';

class Episodes {
  List<Episode> episode = [];

  Episodes();

  Episodes.fromJsonList(List<dynamic> json) {
    if (json == null) return;

    for (final items in json) {
      episode.add(Episode.fromJsonMap(items, colorPalette()));
    }
  }
}

class Episode {
  int id;
  String name;
  String airDate;
  String episode;
  List<dynamic> characters;
  String url;
  Color color;
  bool dark;

  Episode({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.color,
    this.dark,
  });

  factory Episode.fromJsonMap(Map<String, dynamic> json, Color colors) {
    bool darkPalette;

    if (colors == freeSpeechBlue ||
        colors == goodNight ||
        colors == sunsetOrange ||
        colors == highliterPink) {
      darkPalette = true;
    } else {
      darkPalette = false;
    }

    return Episode(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
      episode: json['episode'],
      characters: json['characters'],
      url: json['url'],
      color: colors,
      dark: darkPalette,
    );
  }
}
