//Flutter
import 'package:flutter/material.dart';

//App routes
import 'package:rick_and_morty_app/screens/home/home.dart';
import 'package:rick_and_morty_app/screens/episodes/episodes_screen.dart';
import 'package:rick_and_morty_app/screens/locations/locations_screen.dart';
import 'package:rick_and_morty_app/screens/characters/characters_screen.dart';
import 'package:rick_and_morty_app/screens/graphql_playground/graphql_screen.dart';

//Utils
import 'package:rick_and_morty_app/utils/color_palette.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key key, Size size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = colorPalette();
    Color textColor;

    if (color == freeSpeechBlue ||
        color == goodNight ||
        color == sunsetOrange) {
      textColor = Colors.white;
    } else {
      textColor = Colors.black;
    }
    return Container(
      color: color,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.5),
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 8),
              leading: Image.asset(
                'assets/icons/rick-sanchez.png',
                width: 38,
                height: 38,
              ),
              title: Text('Personajes', style: TextStyle(color: textColor)),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            page: CharactersHome(
                              size: size,
                            ),
                          ))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.5),
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 8),
              leading: Image.asset(
                'assets/icons/movies-folder.png',
                width: 38,
                height: 38,
              ),
              title: Text(
                'Lugares',
                style: TextStyle(color: textColor),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            page: LocationHome(
                              size: size,
                            ),
                          ))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.5),
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 8),
              leading: Image.asset(
                'assets/icons/movies-folder.png',
                width: 38,
                height: 38,
              ),
              title: Text(
                'Episodios',
                style: TextStyle(color: textColor),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            page: EpisodesHome(
                              size: size,
                            ),
                          ))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.5),
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 8),
              leading: Image.asset(
                'assets/icons/graphql.png',
                width: 38,
                height: 38,
              ),
              title: Text('GraphQl Playground',
                  style: TextStyle(color: textColor)),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GraphQLHome(
                            size: size,
                          ))),
            ),
          ),
        ],
      ),
    );
  }
}
