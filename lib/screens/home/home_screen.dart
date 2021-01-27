//Flutter
import 'package:flutter/material.dart';

//App services
import 'package:rick_and_morty_app/services/provider.dart';

//Local widgets
import 'local_widgets/cards.dart';
import 'local_widgets/search.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        flexibleSpace: Search(size: _size),
        toolbarHeight: _size.height * 0.1 + 20,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: CharacterProvider().fetchCharacters(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                if (snapshot.hasData){
                  final character = snapshot.data;
                  return CharacterCards(character: character, size: _size,);
                }else{
                  return ofLoading(_size);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

SizedBox ofLoading(Size size) {
  return SizedBox(
    width: size.width,
    height: size.height,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
