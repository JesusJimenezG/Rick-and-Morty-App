//Flutter
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/widgets/cards.dart';

class LocationHome extends StatefulWidget {
  static String id = 'Episodes';
  final size;
  const LocationHome({Key key, this.size}) : super(key: key);

  @override
  _LocationHomeState createState() => _LocationHomeState();
}

class _LocationHomeState extends State<LocationHome> {
  double _xOffset;
  double _yOffset;
  double _scaleFactor;
  double _border;
  bool _isDrawerOpen;

  @override
  void initState() {
    super.initState();
    _xOffset = 0;
    _yOffset = 0;
    _scaleFactor = 1.0;
    _border = 0;
    _isDrawerOpen = false;
  }

  void scaleFactorUpdate(DragUpdateDetails details, Size size) {
    _xOffset = details.globalPosition.dx;
    _yOffset = details.globalPosition.dx / 2;
    _scaleFactor = details.globalPosition.direction - 0.4;
    _border = 40;
  }

  void drawerState(bool _isDrawerOpen, Size size) {
    if (_isDrawerOpen) {
      _xOffset = size.width * 0.5;
      _yOffset = size.width * 0.5 / 2;
      _scaleFactor = 0.7;
    } else {
      _xOffset = 0;
      _yOffset = 0;
      _scaleFactor = 1.0;
      _border = 0;
    }
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print('EpisodesHome screen: deactivated');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_border),
              bottomLeft: Radius.circular(_border - 20)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(90),
                blurRadius: 5.0,
                spreadRadius: 8.0,
                offset: Offset(10, 5))
          ]),
      transform: Matrix4.translationValues(_xOffset, _yOffset, 0)
        ..scale(_scaleFactor),
      duration: Duration(milliseconds: 250),
      child: GestureDetector(
        //TODO: try to optimize (somehow(?)) the drag and respectives disposes
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          if (details.globalPosition.dx <= widget.size.width * 0.5) {
            setState(() {
              scaleFactorUpdate(details, widget.size);
            });
          }
        },
        onHorizontalDragEnd: (DragEndDetails details) {
          setState(() {
            if (_xOffset >= widget.size.width * 0.4) {
              _isDrawerOpen = true;
            } else {
              _isDrawerOpen = false;
            }
            drawerState(_isDrawerOpen, widget.size);
          });
        },
        child: Column(
          children: [
            Expanded(
                child: Cards(
              path: 'location',
              size: widget.size,
            ))
          ],
        ),
      ),
    );
  }
}
