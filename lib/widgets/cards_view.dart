//Flutter
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

Future cardView(BuildContext context, List data, int index, String id) {
  final cardTheme = (data[index].dark) ? Colors.white : Colors.black;

  Widget widgetCase() {
    switch (id) {
      case 'character':
        return characterView(context, data, index, id, cardTheme);
        break;
      case 'episode':
        return episodeView(context, data, index, id, cardTheme);
        break;
      case 'location':
        return locationView(context, data, index, id, cardTheme);
        break;
      default:
        Center(
          child: CircularProgressIndicator(),
        );
    }
    return SizedBox(
      child: Center(
        child: Text('Life is unexpected.'),
      ),
    );
  }

  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: data[index].color,
          elevation: 12.0,
          insetAnimationDuration: const Duration(milliseconds: 150),
          child: SingleChildScrollView(
            child: widgetCase(),
          ),
        );
      });
}

Column characterView(
    BuildContext context, List data, int index, String id, Color cardTheme) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Image.network(data[index].image),
    Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 12.0),
      child: Text.rich(
        TextSpan(text: 'Nombre: ' + data[index].name),
        style: TextStyle(
          fontSize: 19,
          color: cardTheme,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text.rich(
        TextSpan(text: 'Estado: ' + data[index].status),
        style: TextStyle(
          fontSize: 20,
          color: cardTheme,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text.rich(
        TextSpan(text: 'Especie: ' + data[index].species),
        style: TextStyle(
          fontSize: 20,
          color: cardTheme,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text.rich(
        TextSpan(text: 'Tipo: ' + data[index].type),
        style: TextStyle(
          fontSize: 20,
          color: cardTheme,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text.rich(
        TextSpan(text: 'Género: ' + data[index].gender),
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
            text: 'Origen: ' + data[index].origin['name'],
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch(data[index].origin['url']);
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
            text: 'Location: ' + data[index].location['name'],
          ),
          style: TextStyle(
            fontSize: 20,
            color: cardTheme,
          ),
        ),
        onTap: () => launch(data[index].location['url']),
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
          final characters = <Widget>[];
          data[index].episode.forEach((element) => characters
            ..add(
              SizedBox(
                height: 30,
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 20.0, bottom: 8.0),
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
          while (i < characters.length) {
            return characters[i];
          }
        }),
    Padding(padding: EdgeInsets.only(bottom: 20.0)),
  ]);
}

Column locationView(
    BuildContext context, List data, int index, String id, Color cardTheme) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 40.0, right: 12.0),
      child: Text.rich(
        TextSpan(text: 'Nombre: ' + data[index].name),
        style: TextStyle(
          fontSize: 19,
          color: cardTheme,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 12.0, right: 12.0),
      child: Text.rich(
        TextSpan(text: 'Tipo: ' + data[index].type),
        style: TextStyle(
          fontSize: 20,
          color: cardTheme,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 12.0, right: 12.0),
      child: Text.rich(
        TextSpan(text: 'Dimensión: ' + data[index].dimension),
        style: TextStyle(
          fontSize: 20,
          color: cardTheme,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 12.0, right: 12.0),
      child: Text.rich(
        TextSpan(text: 'Residentes: '),
        style: TextStyle(
          fontSize: 20,
          color: cardTheme,
        ),
      ),
    ),
    //TODO: ADD A GRIDVIEW OF EVERY CHARACTER
    ListView.builder(
        physics: PageScrollPhysics(),
        shrinkWrap: true,
        // ignore: missing_return
        itemBuilder: (context, i) {
          final characters = <Widget>[];
          data[index].residents.forEach((element) => characters
            ..add(
              SizedBox(
                height: 30,
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 20.0, bottom: 8.0),
                  title: Text(
                    element.replaceAll(
                        r'https://rickandmortyapi.com/api/episode/', 'TODO: '),
                    style: TextStyle(color: cardTheme),
                  ),
                  onTap: () => launch(element),
                ),
              ),
            ));
          while (i < characters.length) {
            return characters[i];
          }
        }),
    Padding(padding: EdgeInsets.only(bottom: 20.0)),
  ]);
}

Column episodeView(
    BuildContext context, List data, int index, String id, Color cardTheme) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 40.0, right: 12.0),
      child: Text.rich(
        TextSpan(text: 'Episodio: ' + data[index].episode),
        style: TextStyle(
          fontSize: 20,
          color: cardTheme,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 12.0, right: 12.0),
      child: Text.rich(
        TextSpan(text: 'Nombre: ' + data[index].name),
        style: TextStyle(
          fontSize: 19,
          color: cardTheme,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 12.0, right: 12.0),
      child: Text.rich(
        TextSpan(text: 'Fecha de lanzamiento: ' + data[index].airDate),
        style: TextStyle(
          fontSize: 20,
          color: cardTheme,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 12.0, right: 12.0),
      child: Text.rich(
        TextSpan(text: 'Personajes: '),
        style: TextStyle(
          fontSize: 20,
          color: cardTheme,
        ),
      ),
    ),
    //TODO: ADD A GRIDVIEW OF EVERY CHARACTER
    ListView.builder(
        physics: PageScrollPhysics(),
        shrinkWrap: true,
        // ignore: missing_return
        itemBuilder: (context, i) {
          final characters = <Widget>[];
          data[index].characters.forEach((element) => characters
            ..add(
              SizedBox(
                height: 30,
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 20.0, bottom: 8.0),
                  title: Text(
                    element.replaceAll(
                        r'https://rickandmortyapi.com/api/', 'TODO: '),
                    style: TextStyle(color: cardTheme),
                  ),
                  onTap: () => launch(element),
                ),
              ),
            ));
          while (i < characters.length) {
            return characters[i];
          }
        }),
    Padding(padding: EdgeInsets.only(bottom: 20.0)),
  ]);
}
