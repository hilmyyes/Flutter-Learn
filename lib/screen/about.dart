
import 'package:flutter/material.dart';

class About extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Scaffold(
   appBar: AppBar(
    title: Text('About'),
   ),
   backgroundColor: Colors.cyanAccent,
   body: Center(
  child: Image.network("https://i.pravatar.cc/300?img=[imagenumber]")
   ),
  );
 }
}
