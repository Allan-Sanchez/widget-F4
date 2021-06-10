import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerpage extends StatefulWidget {
  AnimatedContainerpage({Key key}) : super(key: key);

  @override
  _AnimatedContainerpageState createState() => _AnimatedContainerpageState();
}

class _AnimatedContainerpageState extends State<AnimatedContainerpage> {
  double _width = 150.0;
  double _height = 150.0;
  Color _color = Colors.purple[400];
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(10.0),
        child: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            _changeShape();
          },
        ),
      ),
    );
  }

  void _changeShape() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromARGB(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
