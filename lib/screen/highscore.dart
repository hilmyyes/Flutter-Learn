
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HighScore extends StatefulWidget {
  @override
  State<HighScore> createState() => _HighScoreState();
}

class _HighScoreState extends State<HighScore> {
  String top_user = '';
  int top_point = 0;

  @override
  void initState() {
    super.initState();
    checkHighScore();
  }

  Future<void> checkHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    final _topPoint = prefs.getInt('top_point') ?? 0;
    final _topUser = prefs.getString('top_user') ?? '';

    setState(() {
      top_point = _topPoint;
      top_user = _topUser;
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Highscore Quiz'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context), // Navigate back on tap
      ),
    ),
       backgroundColor: Colors.amber,
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Top User: $top_user',
            style: TextStyle(
              fontSize: 24,
              color: Colors.pink,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Top Point: $top_point',
            style: TextStyle(
              fontSize: 24,
              color: Colors.pink,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,

            ),
          ),
        ],
      ),
    ),
  );
}
}
