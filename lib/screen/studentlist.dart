import 'package:flutter/material.dart';
import 'package:hello_word/screen/studentdetail.dart';

class StudentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: Center(
        child: Column(children: [
          Text("Our Student On Emerging Technologgy KP - : \n"),
          for (int id = 12; id <= 70; id+=29)
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentDetail(id)));
                },child: Text("Student #$id")),
        ]),
      ),
    );
  }
}
