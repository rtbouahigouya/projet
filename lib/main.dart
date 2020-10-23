import 'package:flutter/material.dart';
import 'package:projet/COULEUR/couleur.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: jaune),
      home: Home(),
    );
  }
}
