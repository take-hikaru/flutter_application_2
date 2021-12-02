import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum RadioValue { FIRST, SECOND }

void main() => runApp(Nursecall());

class Nursecall extends StatefulWidget {
  Nursecall({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<Nursecall> {
  int _counter = 0;
  RadioValue _gValue = RadioValue.FIRST;

  void _incrementCounter() async {
    setState(() {
      _counter++;
      _setPrefItems(); // Shared Preferenceに値を保存する。
    });
  }

// Shared Preferenceに値を保存されているデータを読み込んで_counterにセットする。
  _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 以下の「counter」がキー名。見つからなければ０を返す
    setState(() {
      _counter = prefs.getInt('counter') ?? 1;
      print(_counter);
    });
  }

// Shared Preferenceにデータを書き込む
  _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 以下の「counter」がキー名。
    prefs.setInt('counter', _counter);
  }

  // Shared Preferenceのデータを削除する
  _removePrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _counter = 0;
      // 以下の「counter」がキー名。
      prefs.remove('counter');
    });
  }

  @override
  void initState() {
    super.initState();
    // 初期化時にShared Preferencesに保存している値を読み込む
    _getPrefItems();
  }

  @override
  Widget build(BuildContext context) {
    var _counter;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // タイトルテキスト
        title: Text('AppBar'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 120.0,
            ),
            RadioListTile(
              title: Text('119番通報'),
              value: RadioValue.FIRST,
              groupValue: _gValue,
              onChanged: (value) => _onRadioSelected(value),
            ),
            RadioListTile(
              title: Text('設定した病院の電話番号'),
              value: RadioValue.SECOND,
              groupValue: _gValue,
              onChanged: (value) => _onRadioSelected(value),
            ),
            Expanded(
              child: TextField(
                  decoration: InputDecoration(hintText: "電話番号を設定"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _counter = value;
                  }),
            ),
            ElevatedButton(
              onPressed: () async {
                _getPrefItems();
              },
              child: Text(
                "保存",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(30), //高さを設定
                onPrimary: Colors.black, //押したときの色！！
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onRadioSelected(value) {
    setState(() {
      _gValue = value;
    });
  }
}
