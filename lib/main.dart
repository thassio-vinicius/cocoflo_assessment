import 'package:cocoflo_assessment/UI/home_screen.dart';
import 'package:cocoflo_assessment/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Cocoflo());
}

class Cocoflo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiProvider>(create: (_) => ApiProvider())
      ],
      child: MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false),
    );
  }
}
