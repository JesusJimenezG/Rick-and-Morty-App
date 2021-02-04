//Flutter
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/graphql_playground/local_widgets/graphql_screen.dart';
import 'package:rick_and_morty_app/widgets/search.dart';

//Widgets
import 'package:rick_and_morty_app/widgets/drawer_screen.dart';

class GraphQLHome extends StatelessWidget {
  static String id = 'GraphQLPlayground';
  final size;
  const GraphQLHome({Key key, this.size}) : super(key: key);

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
          GraphQLPlaygroundScreen(
            size: size,
          ),
        ],
      ),
    );
  }
}
