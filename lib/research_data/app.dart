
import 'package:findadmissionaffiliate/research_data/tab_navigator.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabbed(),
    );
  }
}

void main() => runApp(new App());