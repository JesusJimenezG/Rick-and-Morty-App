//Flutter
import 'package:flutter/material.dart';

//App routes
import 'package:rick_and_morty_app/widgets/home.dart';
import 'package:rick_and_morty_app/screens/episodes/episodes_home.dart';
import 'package:rick_and_morty_app/screens/characters/characters_screen.dart';
import 'package:rick_and_morty_app/screens/graphql_playground/graphql_home.dart';

Map<String, WidgetBuilder> applicationRoutes() {
  final routes = {
    Home.id: (BuildContext context) => Home(),
    CharactersHome.id: (BuildContext context) => CharactersHome(),
    EpisodesHome.id: (BuildContext context) => EpisodesHome(),
    GraphQLHome.id: (BuildContext context) => GraphQLHome()
  };

  return routes;
}
