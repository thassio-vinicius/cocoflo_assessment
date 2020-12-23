import 'package:cocoflo_assessment/home.dart';
import 'package:flutter/material.dart';

void main () {
  runApp(Cocoflo());
}

class Cocoflo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}
