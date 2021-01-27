//Random
import 'dart:math';

//Flutter
import 'package:flutter/material.dart';

const Color sunsetOrange = Color(0xffff5e57);
const Color spiroDiscoBall = Color(0xff0fbcf9);
const Color freeSpeechBlue = Color(0xff3c40c6);
const Color yrielYellow = Color(0xffffdd59);
const Color greenTeal = Color(0xff05c46b);
const Color goodNight = Color(0xff485460);
const Color highliterPink = Color(0xffef5777);
const Color freshTurquoise = Color(0xff34e7e4);
const Color narenjiOrange = Color(0xffffc048);
const Color mintyGreen= Color(0xff0be881);

Color colorPalette(){
  final _colors = [
    sunsetOrange,
    spiroDiscoBall,
    freeSpeechBlue,
    yrielYellow,
    greenTeal,
    goodNight,
    highliterPink,
    freshTurquoise,
    narenjiOrange,
    mintyGreen
  ];

  final randomColor = Random();

  return _colors[randomColor.nextInt(9)];
}