import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/map.dart';
import 'package:intl/intl.dart';

import 'chat.dart';
import 'chatRoom.dart';
import 'login.dart';
import 'profile.dart';
import 'top.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() async {
  Intl.defaultLocale = 'ja_JP';
  initializeDateFormatting('ja_JP');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // ここ大事！

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: const Text('チャットページへ'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage('category1'),
                    ));
                // 押したら反応するコードを書く
                // 画面遷移のコード
              },
            ),
            ElevatedButton(
              child: const Text('ログインページへ'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
                // 押したら反応するコードを書く
                // 画面遷移のコード
              },
            ),
            ElevatedButton(
              child: const Text('マップページへ'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MapApp()));
                // 押したら反応するコードを書く
                // 画面遷移のコード
              },
            ),
            ElevatedButton(
              child: const Text('プロフィールページへ'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
                // 押したら反応するコードを書く
                // 画面遷移のコード
              },
            ),
            ElevatedButton(
              child: const Text('チャットページへ'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopWidget(),
                    ));
                // 押したら反応するコードを書く
                // 画面遷移のコード
              },
            ),
            ElevatedButton(
              child: const Text('チャットルームページへ'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatRoomPage(),
                    ));
                // 押したら反応するコードを書く
                // 画面遷移のコード
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
