// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_field, sized_box_for_whitespace, depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hello_word/class/popactor.dart';

class PopularActor extends StatefulWidget {
  const PopularActor({super.key});

  @override
  State<PopularActor> createState() => _PopularActorState();
}

class _PopularActorState extends State<PopularActor> {
  String _temp = 'waiting API respond…';
  String _txtcari = '';
  List<PopActor> PAs = [];

  Future<String> fetchData() async {
    final response = await http
        .get(Uri.parse("https://ubaya.me/flutter/160421080/actor.php"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to read API');
    }
  }

  bacaData() {
    Future<String> data = fetchData();
    data.then((value) {
      Map json = jsonDecode(value);
      for (var mov in json['data']) {
        PopActor pm = PopActor.fromJson(mov);
        PAs.add(pm);
      }
      setState(() {
        _temp = PAs[2].person_name;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    bacaData();
  }

  Widget DaftarPopActor(PopActs) {
    if (PopActs != null) {
      return ListView.builder(
          itemCount: PopActs.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Card(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person, size: 30),
                  title: Text(PopActs[index].person_name),
                ),
              ],
            ));
          });
    } else {
      return CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
 return Scaffold(
        appBar: AppBar(
          title: const Text('Popular Actors') ),
        body: ListView(children: <Widget>[
           Container(
            height: MediaQuery.of(context).size.height,
            child: DaftarPopActor(PAs),
          )

        ]));
  }
}
