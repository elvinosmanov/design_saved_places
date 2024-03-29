import 'package:design/screens/saved_places.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        title: 'Material App',
        home: SavedPlaces());
  }
}
