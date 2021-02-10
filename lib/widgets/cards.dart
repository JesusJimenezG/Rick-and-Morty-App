//Flutter
import 'package:flutter/material.dart';

//Services
import 'package:rick_and_morty_app/services/provider.dart';

//Local widgets
import 'package:rick_and_morty_app/widgets/cards_view.dart';

// ignore: must_be_immutable
class Cards extends StatefulWidget {
  final size;
  String path;

  Cards({this.size, this.path});

  @override
  _CardsState createState() {
    print('Cards: created');
    return _CardsState();
  }
}

class _CardsState extends State<Cards> {
  final _scrollController = ScrollController();
  final provider = Provider();
  String id;
  int currentPage;
  int cards;
  bool loading;

  @override
  void initState() {
    super.initState();
    print('Cards: init');
    id = widget.path;
    currentPage = 1;
    cards = 20;
    loading = false;
    _scrollController.addListener(updateCards);
    initFetch();
  }

  void initFetch() async {
    await provider.fetchData(id, currentPage);
  }

  void updateCards() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      print('Cards: update');
      cards += 20;
      currentPage++;
      await provider.fetchData(id, currentPage);
      await Future.delayed(Duration(milliseconds: 1000));
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    print('Cards: controller dispose');
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Cards: build');
    return StreamBuilder(
        stream: provider.dataStream,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(
                      top: widget.size.height * 0.2,
                      left: 12.0,
                      right: 12.0,
                      bottom: 8.0),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (id == 'character') ? 2 : 1,
                      childAspectRatio: (id == 'character') ? 0.75 : 4.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () => cardView(context, data, index, id),
                          child: ofCard(data, index));
                    }, childCount: cards),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(right: widget.size.width * 0.2),
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: widget.size.width * 0.1),
                          child: Text(
                            'página: $currentPage',
                            style: TextStyle(
                                color: Colors.black.withAlpha(120),
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return ofLoading();
          }
        });
  }

  Card ofCard(List data, int index) {
    return Card(
      elevation: 8,
      child: Stack(
        fit: StackFit.loose,
        children: [
          (id == 'character')
              ? Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: SizedBox(
                      child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: data[index].color,
                    ),
                    child: Center(
                        child: Text(
                      data[index].name,
                      style: TextStyle(
                        color: (data[index].dark) ? Colors.white : Colors.black,
                      ),
                    )),
                  )),
                )
              : SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: data[index].color,
                    ),
                    child: Center(
                        child: Text(
                      (id == 'episode')
                          ? data[index].name + ' - ' + data[index].episode
                          : data[index].name + ' - ' + data[index].dimension,
                      style: TextStyle(
                        color: (data[index].dark) ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
          (id == 'character') ? Image.network(data[index].image) : SizedBox(),
        ],
      ),
    );
  }

  SizedBox ofLoading() {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
