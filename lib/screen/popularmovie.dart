import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hello_word/class/popmovie.dart';

class PopularMovie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PopularMovieState();
  }
}
class _PopularMovieState extends State<PopularMovie> {

  String _temp = 'waiting API respond…';
  List<PopMovie> PMs = [];

 Future<String> fetchData() async {
  final response = await http
    .get(Uri.parse("https://ubaya.me/flutter/160421080/movie.php"));
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
        PopMovie pm = PopMovie.fromJson(mov);
        PMs.add(pm);
      }
      setState(() {
        _temp = PMs[45].title;
      });
  });
 }

@override
 void initState() {
  super.initState();
  bacaData();
 }

Widget DaftarPopMovie(PopMovs) {
    if (PopMovs != null) {
      return ListView.builder(
          itemCount: PopMovs.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return 
             Card(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.movie, size: 30),
                  title: Text(PopMovs[index].title),
                  subtitle: Text(PopMovs[index].overview),
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
          title: const Text('Popular Movie') ),
        body: ListView(children: <Widget>[
           Container(
            height: MediaQuery.of(context).size.height,
            child: DaftarPopMovie(PMs),
          )

        ]));
  }
}
