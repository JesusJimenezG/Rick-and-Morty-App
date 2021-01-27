//Flutter
import 'package:flutter/material.dart';

//Utils
import 'package:rick_and_morty_app/utils/color_palette.dart';

class Characters{
  List<Character> character = [];

  Characters();

  Characters.fromJsonList(List<dynamic> json){
    if (json == null) return;

    for (final items in json){
      character.add(Character.fromJsonMap(items, colorPalette()));
    }
  }

}

class Character {
  
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Map<String, dynamic> origin;
  Map<String, dynamic> location;
  String image;
  List<dynamic> episode;
  String url;
  Color color;
  bool dark;

  Character({
      this.id,
      this.name,
      this.status,
      this.gender,
      this.species,
      this.type,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.color,
      this.dark,
    });

  factory Character.fromJsonMap(Map<String, dynamic> json, Color colors) {

    bool darkPalette;

    if (colors == freeSpeechBlue 
        || colors == goodNight
        || colors == sunsetOrange
        || colors == highliterPink) {
          darkPalette = true;
    } else {
      darkPalette = false;
    }

    return Character(
      id      : json['id'],
      name    : json['name'],
      status  : json['status'],
      gender  : json['gender'],
      species : json['species'],
      type    : json['type'],
      origin  : json['origin'],
      location: json['location'],
      image   : json['image'],
      episode : json['episode'],
      url     : json['url'],
      color   : colors,
      dark    : darkPalette,   
    );
  }
}
