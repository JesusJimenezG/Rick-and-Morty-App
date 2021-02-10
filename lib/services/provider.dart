//Dart for json
import 'dart:convert';
import 'dart:async';

//Http methods
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/models/characters.dart';

//location model
import 'package:rick_and_morty_app/models/locations.dart';
import 'package:rick_and_morty_app/models/episodes.dart';

class Provider {
  final _url = 'rickandmortyapi.com';
  // ignore: prefer_final_fields
  List _characters = [];
  // ignore: prefer_final_fields
  List _episodes = [];
  // ignore: prefer_final_fields
  List _locations = [];
  final _stream = StreamController<List>.broadcast();

  Function(List) get dataSink => _stream.sink.add;
  Stream<List> get dataStream => _stream.stream;

  void dispose() {
    _stream?.close();
  }

  Future<List> fetchData(String path, int currentPage) async {
    dynamic results;
    print(currentPage);
    final response = await http.get(
      Uri.https(_url, 'api/$path', {'page': currentPage.toString()}),
    );

    if (response.statusCode == 200) {
      results = jsonDecode(response.body);
      if (currentPage < results['info']['pages']) {
        if (path == 'character') {
          final characterFetched = Characters.fromJsonList(results['results']);
          _characters.addAll(characterFetched.character);
          dataSink(_characters);
          return characterFetched.character;
        }

        if (path == 'episode') {
          final episodeFetched = Episodes.fromJsonList(results['results']);
          _episodes.addAll(episodeFetched.episode);
          dataSink(_episodes);
          return episodeFetched.episode;
        }

        if (path == 'location') {
          final locationFetched = Locations.fromJsonList(results['results']);
          _locations.addAll(locationFetched.location);
          dataSink(_locations);
          return locationFetched.location;
        }
      } else {
        return [];
      }
    } else {
      throw Exception('Fallo al cargar personajes');
    }
    return results;
  }
}
