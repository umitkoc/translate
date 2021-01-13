import 'package:flutter/material.dart';

import 'page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: TranslatePage(),
    );
  }
}
