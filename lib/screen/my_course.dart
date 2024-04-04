// ini punya gwe

import 'package:flutter/material.dart';
import 'package:hello_word/screen/course_detail.dart';

class MyCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course'),
      ),
      body: SingleChildScrollView(
        child: Center(
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/hiu.png'), radius: 50.0,
              )
            ),
            Container(
              child: Column(
                children: [
                  Text("Muhammad Hilmy Irfansa", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('160421080'),
                  Text('Information Management and Enterprise'),
                  Text('Genap 2024/2025'),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Column(children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CourseDetail(
                                            "KP A",
                                            "Senin",
                                            "10.40",
                                            "TF 4.2",
                                            2,
                                            "Leadership and Professional Ethics")));
                              },
                              child: Text("LPE (A)"),
                              style: TextButton.styleFrom(
                                fixedSize: Size(300, 40),
                                backgroundColor: const Color.fromARGB(255, 222, 91, 135),
                                foregroundColor: Colors.black
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Column(children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CourseDetail(
                                            "KP F",
                                            "Selasa",
                                            "09.45",
                                            "TB 01.09",
                                            3,
                                            "Web Framework Programming")));
                              },
                              child: Text("WFP (F)"),
                              style: TextButton.styleFrom(
                                fixedSize: Size(300, 40),
                                backgroundColor: const Color.fromARGB(255, 222, 91, 135),
                                foregroundColor: Colors.black
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Column(children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CourseDetail(
                                            "KP ZB",
                                            "Rabu",
                                            "07.00",
                                            "TF 03.02",
                                            3,
                                            "Research Methodology")));
                              },
                              child: Text("RM (ZB)"),
                              style: TextButton.styleFrom(
                                fixedSize: Size(300, 40),
                                backgroundColor: const Color.fromARGB(255, 222, 91, 135),
                                foregroundColor: Colors.black
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Column(children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CourseDetail(
                                            "KP A",
                                            "Rabu",
                                            "09.45",
                                            "TF 4.2",
                                            3,
                                            "System Testing & Implementation")));
                              },
                              child: Text("STI (A)"),
                              style: TextButton.styleFrom(
                                fixedSize: Size(300, 40),
                                backgroundColor: const Color.fromARGB(255, 222, 91, 135),
                                foregroundColor: Colors.black
                              ),
                            ),
                          ]),
                        ),
                         Container(
                          margin: EdgeInsets.all(10),
                          child: Column(children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CourseDetail(
                                            "KP -",
                                            "Kamis",
                                            "07.00",
                                            "TB 01.01C",
                                            3,
                                            "Emerging Technology")));
                              },
                              child: Text("ET (-)"),
                              style: TextButton.styleFrom(
                                fixedSize: Size(300, 40),
                                backgroundColor: const Color.fromARGB(255, 222, 91, 135),
                                foregroundColor: Colors.black
                              ),
                            ),
                          ]),
                        ),
                         Container(
                          margin: EdgeInsets.all(10),
                          child: Column(children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CourseDetail(
                                            "KP C",
                                            "Kamis",
                                            "13.00",
                                            "TC 04.01C",
                                            3,
                                            "Advance Native Mobile Programming")));
                              },
                              child: Text("ANMP (C)"),
                              style: TextButton.styleFrom(
                                fixedSize: Size(300, 40),
                                backgroundColor: const Color.fromARGB(255, 222, 91, 135),
                                foregroundColor: Colors.black
                              ),
                            ),
                          ]),
                        ),
                         Container(
                          margin: EdgeInsets.all(10),
                          child: Column(children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CourseDetail(
                                            "KP B",
                                            "Rabu",
                                            "13.00",
                                            "TC 04.01A",
                                            3,
                                            "Enterprise System Implementation")));
                              },
                              child: Text("ESI (B)"),
                              style: TextButton.styleFrom(
                                fixedSize: Size(300, 40),
                                backgroundColor: const Color.fromARGB(255, 222, 91, 135),
                                foregroundColor: Colors.black
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
