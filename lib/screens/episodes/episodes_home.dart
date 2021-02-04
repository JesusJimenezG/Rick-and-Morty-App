import 'package:flutter/material.dart';

//App
import 'package:rick_and_morty_app/widgets/search.dart';
import 'package:rick_and_morty_app/widgets/drawer_screen.dart';

//Local widgets
import 'local_widgets/episodes_screen.dart';

class EpisodesHome extends StatelessWidget {
  static String id = 'Episodes';
  final size;
  const EpisodesHome({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        flexibleSpace: Search(),
        toolbarHeight: 120,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          DrawerScreen(),
          Episodes(
            size: size,
          ),
        ],
      ),
    );
  }
}
