//Flutter
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/home/local_widgets/cards_view.dart';

class CharacterCards extends StatefulWidget {
  final size;
  final character;
  final search;

  CharacterCards({
    this.character,
    this.size,
    this.search
    });

  @override
  _CharacterCardsState createState() => _CharacterCardsState();
}

class _CharacterCardsState extends State<CharacterCards> {
  final _scrollController = ScrollController();
  int cards = 6;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        for (var i = 0; i < 6 && cards < 20; i++) {
          cards++;
        }
        setState(() {});
        if (cards == 20) {
          dispose();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
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
          return GestureDetector(
            onTap: () {
              cardView(context, widget.character, index);
            },
            child: ofCard(widget.character, index),
          );
        });
  }
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
