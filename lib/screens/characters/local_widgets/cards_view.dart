//Flutter
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

Future cardView(BuildContext context, List character, int index) {
  final cardTheme = (character[index].dark) ? Colors.white : Colors.black;
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: character[index].color,
          elevation: 12.0,
          insetAnimationDuration: const Duration(milliseconds: 150),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.network(character[index].image),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 12.0),
                child: Text.rich(
                  TextSpan(text: 'Nombre: ' + character[index].name),
                  style: TextStyle(
                    fontSize: 19,
                    color: cardTheme,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text.rich(
                  TextSpan(text: 'Estado: ' + character[index].status),
                  style: TextStyle(
                    fontSize: 20,
                    color: cardTheme,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text.rich(
                  TextSpan(text: 'Especie: ' + character[index].species),
                  style: TextStyle(
                    fontSize: 20,
                    color: cardTheme,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text.rich(
                  TextSpan(text: 'Tipo: ' + character[index].type),
                  style: TextStyle(
                    fontSize: 20,
                    color: cardTheme,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text.rich(
                  TextSpan(text: 'Género: ' + character[index].gender),
                  style: TextStyle(
                    fontSize: 20,
                    color: cardTheme,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text.rich(
                  TextSpan(
                      text: 'Origen: ' + character[index].origin['name'],
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch(character[index].origin['url']);
                        }),
                  style: TextStyle(
                    fontSize: 20,
                    color: cardTheme,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: InkWell(
                  child: Text.rich(
                    TextSpan(
                      text: 'Location: ' + character[index].location['name'],
                    ),
                    style: TextStyle(
                      fontSize: 20,
                      color: cardTheme,
                    ),
                  ),
                  onTap: () => launch(character[index].location['url']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text.rich(
                  TextSpan(text: 'Lista de episodios: '),
                  style: TextStyle(
                    fontSize: 20,
                    color: cardTheme,
                  ),
                ),
              ),
              ListView.builder(
                  physics: PageScrollPhysics(),
                  shrinkWrap: true,
                  // ignore: missing_return
                  itemBuilder: (context, i) {
                    final episodes = <Widget>[];
                    character[index].episode.forEach((element) => episodes
                      ..add(
                        SizedBox(
                          height: 30,
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.only(left: 20.0, bottom: 8.0),
                            title: Text(
                              element.replaceAll(
                                  r'https://rickandmortyapi.com/api/episode/',
                                  'Episodio: '),
                              style: TextStyle(color: cardTheme),
                            ),
                            onTap: () => launch(element),
                          ),
                        ),
                      ));
                    while (i < episodes.length) {
                      return episodes[i];
                    }
                  }),
              Padding(padding: EdgeInsets.only(bottom: 20.0)),
            ]),
          ),
        );
      });
}
