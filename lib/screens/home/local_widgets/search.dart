//Flutter
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final size;

  Search({this.size});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
