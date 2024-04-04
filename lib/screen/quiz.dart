import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_word/class/question.dart';

import 'dart:async';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hello_word/main.dart';


class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String formatTime(int hitung) {
    var hours = (hitung ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((hitung % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (hitung % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  late Timer _timer;
  int _hitung = 15;
  int _initValue = 15;
  List<QuestionObj> _questions = [];
  int _question_no = 0;
  int _point = 0;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        if (_hitung == 0) {
          _question_no++;
          if (_question_no > _questions.length - 1) {
            finishQuiz();
          }
          _hitung = _initValue;
        } else {
          _hitung--;
        }
      });
    });

    _questions.add(QuestionObj(
        "Above picture is a scene of what movie? ",
        'https://i0.wp.com/www.rukita.co/stories/wp-content/uploads/2022/04/p19323017_k_h8_aa.jpeg?resize=720%2C405&ssl=1',
        'Naruto',
        'Dora',
        'Boboiboy',
        'Upin Ipin',
        'Boboiboy'));
    _questions.add(QuestionObj(
        "Above picture is a scene of what movie? ",
        'https://memora.id/wp-content/uploads/2023/05/FROZEN-1_11zon.jpg',
        'Beauty and the Beast',
        'Toy Story',
        'Aladin',
        'Frozen',
        'Frozen')); //jawaban
    _questions.add(QuestionObj(
        "Above picture is a scene of what movie? ",
        'https://images.indianexpress.com/2015/10/annabelle759.jpg',
        'Zombie',
        'Insidious',
        'Annabelle',
        'The nun',
        'Annabelle'));
    _questions.add(QuestionObj(
        "Above picture is a scene of what movie? ",
        'https://jagatplay.com/wp-content/uploads/2021/09/marvel-spider-man-22.jpg',
        'Spiderman',
        'Batman',
        'Ironman',
        'Superman',
        'Spiderman'));
    _questions.add(QuestionObj(
        "Above picture is a scene of what movie? ",
        'https://i.kinja-img.com/image/upload/c_fill,h_900,q_60,w_1600/0b6a12ddec48d95278105ca50eb49bcf.jpg',
        'Black Panther',
        'Ice Ace',
        'Kingkong',
        'Kung Fu Panda',
        'Black Panther'));

    // new question (challenge)

    _questions.add(QuestionObj(
        "Above picture is a scene of what anime? ",
        'https://a.storyblok.com/f/178900/1920x1080/806ea7a85d/frieren-10m.jpeg',
        'Frieren: Beyond Journeys End',
        'Fullmetal Alchemist: Brotherhood',
        'Steins;Gate',
        'Bleach',
        'Frieren: Beyond Journeys End'));

    _questions.add(QuestionObj(
        "Above picture is a scene of what anime? ",
        'https://www.greenscene.co.id/wp-content/uploads/2021/04/Fullmetal.jpg',
        'Frieren: Beyond Journeys End',
        'Fullmetal Alchemist: Brotherhood',
        'Steins;Gate',
        'Bleach',
        'Fullmetal Alchemist: Brotherhood'));

    _questions.add(QuestionObj(
        "Above picture is a scene of what anime? ",
        'https://media.suara.com/pictures/653x366/2023/12/12/12625-steins-gate.jpg',
        'Frieren: Beyond Journeys End',
        'Fullmetal Alchemist: Brotherhood',
        'Steins;Gate',
        'Bleach',
        'Steins;Gate'));

    _questions.add(QuestionObj(
        "Above picture is a scene of what anime? ",
        'https://i.pinimg.com/736x/e6/91/8c/e6918c3f8d99914681828e339b55c36e.jpg',
        'Frieren: Beyond Journeys End',
        'Fate Zero',
        'Steins;Gate',
        'Bleach',
        'Fate Zero'));

    _questions.add(QuestionObj(
        "Above picture is a scene of what anime? ",
        'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/682/2023/09/05/8a772-16925432869201-1920-1-3959115607.jpg',
        'Frieren: Beyond Journeys End',
        'Fate Zero',
        'Steins;Gate',
        'Bleach',
        'Bleach'));

    final random = Random();
    _questions.shuffle(random);
    _questions = _questions.take(5).toList();
  }

  @override
  void dispose() {
    _timer.cancel();
    _hitung = 0;
    super.dispose();
  }

  void startTimer() {
    setState(() {
      _timer = Timer.periodic(Duration(seconds: 200), (timer) {
        setState(() {
          _hitung++;
        });
      });
    });
  }

  void checkAnswer(String answer) {
    setState(() {
      if (answer == _questions[_question_no].answer) {
        _point += 100;
      }
      _question_no++;
      if (_question_no > _questions.length - 1) {
        _question_no = 0;
        finishQuiz();
      }
      _hitung = _initValue;
    });
  }

  finishQuiz() {
    _timer.cancel();
    _question_no = 0;

    String message;
    if (_point == 500) {
      message = "Selamat, anda betul semua!";
    }else {
      message =
          "Eits, jawabanmu ada yang salah tuh. Semangat mencoba lagi yaa ~";
    }

    showDialog<String>(
        context: context,
        barrierDismissible: false, //Prevent dialog from closing on outside touch in Flutter
        builder: (BuildContext context) => AlertDialog(
              title: Text('Quiz'),
              content: Text('Your point = $_point \n' + message ),
              actions: <Widget>[
                TextButton(
              onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final _topPoint = prefs.getInt('top_point') ?? 0;

              if (_point > _topPoint) {
                prefs.setInt('top_point', _point);
                prefs.setString('top_user', active_user);
              }

              Navigator.pop(context, 'OK');
              Navigator.pop(context);
            },
            child: Text('OK'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            LinearPercentIndicator(
              center: Text(formatTime(_hitung)),
              width: MediaQuery.of(context).size.width,
              lineHeight: 20.0,
              percent: 1 - (_hitung / _initValue),
              backgroundColor: Colors.green,
              progressColor: Colors.red,
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              child: Image.network(_questions[_question_no].image),
            ),
            SizedBox(height: 10),
            Text(_questions[_question_no].narration),
            TextButton(
                onPressed: () {
                  checkAnswer(_questions[_question_no].option_a);
                },
                child: Text("A. " + _questions[_question_no].option_a)),
            TextButton(
                onPressed: () {
                  checkAnswer(_questions[_question_no].option_b);
                },
                child: Text("B. " + _questions[_question_no].option_b)),
            TextButton(
                onPressed: () {
                  checkAnswer(_questions[_question_no].option_c);
                },
                child: Text("C. " + _questions[_question_no].option_c)),
            TextButton(
                onPressed: () {
                  checkAnswer(_questions[_question_no].option_d);
                },
                child: Text("D. " + _questions[_question_no].option_d)),

            Divider(),
            Text('skor = $_point'),
            
          ],
        ),
      ),
    );
  }
}
