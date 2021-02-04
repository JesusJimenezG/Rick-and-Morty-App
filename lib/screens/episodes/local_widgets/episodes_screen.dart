//Flutter
import 'package:flutter/material.dart';

class Episodes extends StatefulWidget {
  final size;
  const Episodes({Key key, this.size}) : super(key: key);

  @override
  _EpisodesState createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {
  double xOffset;
  double yOffset;
  double scaleFactor;
  double border;
  bool isDrawerOpen;

  @override
  void initState() {
    super.initState();
    xOffset = 0;
    yOffset = 0;
    scaleFactor = 1.0;
    border = 0;
    isDrawerOpen = false;
  }

  void scaleFactorUpdate(DragUpdateDetails details, Size size) {
    xOffset = details.globalPosition.dx;
    yOffset = details.globalPosition.dx / 2;
    scaleFactor = details.globalPosition.direction - 0.4;
    border = 40;
  }

  void drawerState(bool isDrawerOpen, Size size) {
    if (isDrawerOpen) {
      xOffset = size.width * 0.5;
      yOffset = size.width * 0.5 / 2;
      scaleFactor = 0.7;
    } else {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1.0;
      border = 0;
    }
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print('Episodes screen: deactivated');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(border),
                bottomLeft: Radius.circular(border)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(90),
                  blurRadius: 5.0,
                  spreadRadius: 8.0,
                  offset: Offset(10, 5))
            ]),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
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
              if (xOffset >= widget.size.width * 0.4) {
                isDrawerOpen = true;
              } else {
                isDrawerOpen = false;
              }
              drawerState(isDrawerOpen, widget.size);
            });
          },
          child: Container(
            width: widget.size.width,
            height: widget.size.height,
            color: Colors.grey,
            child: Center(
              child: Text(
                'En construcción...',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
