// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hello_word/screen/about.dart';
import 'package:hello_word/screen/history.dart';
import 'package:hello_word/screen/home.dart';
import 'package:hello_word/screen/itembasket.dart';
import 'package:hello_word/screen/login.dart';
import 'package:hello_word/screen/search.dart';
import 'package:hello_word/screen/studentlist.dart';
import 'package:hello_word/screen/my_course.dart';
import 'package:hello_word/screen/addrecipe.dart';
import 'package:hello_word/screen/quiz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hello_word/screen/highscore.dart';

import 'screen/basket.dart';

String active_user = "";

Future<String> checkUser() async {
  final prefs = await SharedPreferences.getInstance();
  String user_id = prefs.getString("user_id") ?? '';
  return user_id;
}

void doLogout() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("user_id");
  main();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  checkUser().then((String result) {
    if (result == '')
      runApp(MyLogin());
    else {
      active_user = result;
      runApp(MyApp());
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        'about': (context) => About(),
        'itembasket': (context) => ItemBasket(2, 3),
        'studentlist': (context) => StudentList(),
        'my_course': (context) => MyCourse(),
        'addrecipe': (context) => AddRecipe(),
        'quiz': (context) => Quiz(),
        'highscore': (context) => HighScore(),
        'basket': (context) => Basket(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _user_id = "";

  @override
  void initState() {
    super.initState();
    checkUser().then((value) => setState(
          () {
            _user_id = value;
          },
        ));
  }

  int _counter = 0;
  int _currentIndex = 0;
  final List<Widget> _screens = [Home(), Search(), History()];
  final List<String> _title = ['Home', 'Search', 'History'];
  String _emoji = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void setEmojiCounter() {
    setState(() {
      Runes smileEmoji = Runes('\u{1f600}');
      Runes angryEmoji = Runes('\u{1f611}');

      if (_counter % 5 == 0) {
        _emoji = _emoji + String.fromCharCodes(angryEmoji);
      } else {
        _emoji = _emoji + String.fromCharCodes(smileEmoji);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_title[_currentIndex]),
      ),

      drawer: myDrawer(),

      body: _screens[_currentIndex],

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          setEmojiCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

      persistentFooterButtons: <Widget>[
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.skip_previous),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.skip_next),
        ),
      ],

      bottomNavigationBar: BottomNavigationBar(
          currentIndex:
              0, //menunjukkan halaman apa yang aktif (item 0 merupakan item yang aktif)
          fixedColor: Colors.teal,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "History",
              icon: Icon(Icons.history),
            ),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }

  Drawer myDrawer() {
    return Drawer(
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("xyz"),
              accountEmail: Text(_user_id),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://i.pravatar.cc/150"))),
          ListTile(
            title: new Text("Inbox"),
            leading: new Icon(Icons.inbox),
          ),
          ListTile(
            title: new Text("My Basket "),
            leading: new Icon(Icons.shopping_basket),
            onTap: () {
              Navigator.pushNamed(context, "basket");
            },
          ),
          ListTile(
              title: Text("Add Recipe"),
              leading: Icon(Icons.file_open),
              onTap: () {
                Navigator.pushNamed(context, "addrecipe");
              }),
          ListTile(
              title: Text("Quiz"),
              leading: Icon(Icons.quiz),
              onTap: () {
                Navigator.pushNamed(context, "quiz");
              }),
          ListTile(
              title: Text("High Score"),
              leading: Icon(Icons.quiz),
              onTap: () {
                Navigator.pushNamed(context, "highscore");
              }),
          ListTile(
            title: new Text("About"),
            leading: new Icon(Icons.help),
            onTap: () {
              Navigator.pushNamed(context, "about");
            },
          ),
          ListTile(
            title: new Text("Student List "),
            leading: new Icon(Icons.info),
            onTap: () {
              Navigator.pushNamed(context, "studentlist");
            },
          ),
          ListTile(
            title: new Text("My_Course"),
            leading: new Icon(Icons.info),
            onTap: () {
              Navigator.pushNamed(context, "my_course");
            },
          ),
          ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
              onTap: () {
                doLogout();
              })
        ],
      ),
    );
  }
}
