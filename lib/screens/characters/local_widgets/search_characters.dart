//Flutter
import 'package:flutter/material.dart';

class SearchCharacters extends StatefulWidget {
  final size;

  SearchCharacters({this.size});

  @override
  _SearchCharactersState createState() => _SearchCharactersState();
}

class _SearchCharactersState extends State<SearchCharacters> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.size.width * 0.1 - 20,
        top: widget.size.height * 0.1 - 10,
        right: widget.size.width * 0.1 - 20,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        elevation: 12.0,
        child: TextFormField(
          controller: _searchController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20, top: 15),
            hintText: 'Busca un personaje aquí',
            suffixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
          //TO-DO implements search
          /* onEditingComplete: () {
            CharacterCards(search: _searchController.text);
          }, */
        ),
      ),
    );
  }
}
