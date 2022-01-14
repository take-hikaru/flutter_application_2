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
  String _counter = "";

  RadioValue _gValue = RadioValue.FIRST;

// Shared Preferenceにデータを書き込む
  _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 以下の「counter」がキー名。
    prefs.setString('counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // タイトルテキスト
        title: Text('ナースコール設定'),
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
                if (_gValue == RadioValue.FIRST) {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('counter');

// Shared Preferenceにデータを書き込む
                  _setPrefItems() async {
                    _counter = "119";
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    // 以下の「counter」がキー名。
                    prefs.setString('counter', _counter);
                  }

                  _setPrefItems();

                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        content: Text(_counter + "を登録しました。"),
                        actions: <Widget>[
                          // ボタン領域
                          FlatButton(
                            child: Text("Cancel"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    },
                  );
                } else {
// Shared Preferenceにデータを書き込む
                  _setPrefItems() async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    // 以下の「counter」がキー名。
                    prefs.setString('counter', _counter);
                  }

                  if (RegExp(r"(0[789]0+\d{8})").hasMatch(_counter)) {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.remove('counter');
                    _setPrefItems();
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          content: Text(_counter + "を登録しました。"),
                          actions: <Widget>[
                            // ボタン領域
                            FlatButton(
                              child: Text("Cancel"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            FlatButton(
                              child: Text("OK"),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          content: Text("ちゃんと入力して下さい"),
                          actions: <Widget>[
                            // ボタン領域
                            FlatButton(
                              child: Text("Cancel"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            FlatButton(
                              child: Text("OK"),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
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
