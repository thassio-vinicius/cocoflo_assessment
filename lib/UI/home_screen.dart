import 'package:cocoflo_assessment/UI/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo Organizer')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            ResultScreen(collectionSelected: false))),
                child: Text('search photos')),
          ),
          Center(
            child: RaisedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            ResultScreen(collectionSelected: true))),
                child: Text('search collections')),
          ),
        ],
      ),
    );
  }
}
