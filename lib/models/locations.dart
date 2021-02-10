//Flutter
import 'package:flutter/material.dart';

//Utils
import 'package:rick_and_morty_app/utils/color_palette.dart';

class Locations {
  List<Location> location = [];

  Locations();

  Locations.fromJsonList(List<dynamic> json) {
    if (json == null) return;

    for (final items in json) {
      location.add(Location.fromJsonMap(items, colorPalette()));
    }
  }
}

class Location {
  int id;
  String name;
  String type;
  String dimension;
  List<dynamic> residents;
  String url;
  Color color;
  bool dark;

  Location({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.color,
    this.dark,
  });

  factory Location.fromJsonMap(Map<String, dynamic> json, Color colors) {
    bool darkPalette;

    if (colors == freeSpeechBlue ||
        colors == goodNight ||
        colors == sunsetOrange ||
        colors == highliterPink) {
      darkPalette = true;
    } else {
      darkPalette = false;
    }

    return Location(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
      residents: json['residents'],
      url: json['url'],
      color: colors,
      dark: darkPalette,
    );
  }
}
