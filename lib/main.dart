import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dice Roller'),
        ),
        body: Center(
          child: Die(),
        ),
      ),
    );
  }
}

class Die extends StatefulWidget {
  @override
  _DieState createState() => _DieState();
}

class _DieState extends State<Die> {
  int _value = 1;

  void _roll() {
    setState(() {
      _value = Random().nextInt(6) + 1;
    });
  }

  List<Widget> _getDots() {
    List<Widget> dots = [];
    switch (_value) {
      case 1:
        dots.add(_buildDot());
        break;
      case 2:
        dots.add(_buildDot());
        dots.add(_buildDot());
        break;
      case 3:
        dots.add(_buildDot());
        dots.add(_buildDot());
        dots.add(_buildDot());
        break;
      case 4:
        dots.add(_buildRow([_buildDot(), _buildDot()], padding: 5.0));
        dots.add(_buildRow([_buildDot(), _buildDot()], padding: 5.0));
        break;
      case 5:
        dots.add(_buildRow([_buildDot(), _buildDot()], padding: 5.0));
        dots.add(_buildDot());
        dots.add(_buildRow([_buildDot(), _buildDot()], padding: 5.0));
        break;
      case 6:
        dots.add(_buildRow([_buildDot(), _buildDot()], padding: 5.0));
        dots.add(_buildRow([_buildDot(), _buildDot()], padding: 5.0));
        dots.add(_buildRow([_buildDot(), _buildDot()], padding: 5.0));
        break;
    }
    return dots;
  }

  Widget _buildDot() {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildRow(List<Widget> children, {double padding = 0.0}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children
          .map((child) => Padding(
                padding: EdgeInsets.all(padding),
                child: child,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _roll,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getDots(),
        ),
      ),
    );
  }
}
