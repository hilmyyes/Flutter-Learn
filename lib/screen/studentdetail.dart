import 'package:flutter/material.dart';

class StudentDetail extends StatelessWidget {
  final int imagenumber;
  StudentDetail(this.imagenumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Detail $imagenumber'),
      ),
      body: Center(
          child: Image.network('https://i.pravatar.cc/300?img=[$imagenumber]')),
    );
  }
}
