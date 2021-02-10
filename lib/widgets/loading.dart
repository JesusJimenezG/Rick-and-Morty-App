import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final size;
  const Loading({Key key, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
