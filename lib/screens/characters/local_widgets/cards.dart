//Flutter
import 'package:flutter/material.dart';

//Local widgets
import 'package:rick_and_morty_app/screens/characters/local_widgets/cards_view.dart';

class CharacterCards extends StatefulWidget {
  final size;
  final character;
  final search;

  CharacterCards({this.character, this.size, this.search});

  @override
  _CharacterCardsState createState() => _CharacterCardsState();
}

class _CharacterCardsState extends State<CharacterCards> {
  final _scrollController = ScrollController();
  int cards;
  bool loading;

  @override
  void initState() {
    super.initState();
    cards = 6;
    updateCards();
  }

  bool updateCards() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        for (var i = 0; i < 5 && cards < widget.character.length; i++) {
          cards++;
        }
        setState(() {});
        if (cards == widget.character.length) {
          dispose();
          return loading = false;
        }
        return loading = true;
      }
    });
    return loading = false;
  }

  @override
  void dispose() {
    super.dispose();
    print('Cards: controller dispose');
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(
            vertical: widget.size.height * 0.2,
            horizontal: widget.size.width * 0.1 - 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        controller: _scrollController,
        itemCount: cards,
        itemBuilder: (context, index) {
          if (loading) {
            //TODO: CREATE THE CIRCULASS PROGRESS WHILE LOADING
            //CircularProgressIndicator();
            Future.delayed(Duration(milliseconds: 200));
          }
          return GestureDetector(
            onTap: () {
              cardView(context, widget.character, index);
            },
            child: ofCard(widget.character, index),
          );
        });
  }

  Card ofCard(List character, int index) {
    return Card(
      elevation: 8,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: SizedBox(
                child: DecoratedBox(
              decoration: BoxDecoration(
                color: character[index].color,
              ),
              child: Center(
                  child: Text(
                character[index].name,
                style: TextStyle(
                  color: (character[index].dark) ? Colors.white : Colors.black,
                ),
              )),
            )),
          ),
          Image.network(character[index].image),
        ],
      ),
    );
  }
}
