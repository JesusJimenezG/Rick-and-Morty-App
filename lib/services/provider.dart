//Dart for json
import 'dart:convert';

//Http methods
import 'package:http/http.dart' as http;

//Character model
import 'package:rick_and_morty_app/models/characters.dart';

class CharacterProvider{

  final String _url = 'rickandmortyapi.com';

  Future<List<Character>> fetchCharacters() async{

    final response = await http.get(Uri.https(_url, 'api/character'));

    if(response.statusCode == 200){

      final results = jsonDecode(response.body);

      final characterFetched = Characters.fromJsonList(results['results']);

      return characterFetched.character;
    }else{
      
      throw Exception('Fallo al cargar personajes');
    }
  }

}