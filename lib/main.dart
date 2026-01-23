//Only App Startup & root widget

import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(const PulaarApp());

class PulaarApp extends StatelessWidget{
  const PulaarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pulaar Learning',
      home: HomePage(),
    );
  }
}