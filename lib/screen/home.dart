
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Scaffold(
   appBar: AppBar(
    title: Text('Home'),
   ),
   backgroundColor: Colors.cyanAccent,
   body: Center(
  child: Text("This is Home "),
   ),
  );
 }
}
