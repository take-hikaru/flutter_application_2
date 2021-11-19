import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum RadioValue { FIRST, SECOND }

class Nursecall extends StatefulWidget {
  Nursecall({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<Nursecall> {
  RadioValue _gValue = RadioValue.FIRST;

  @override
  Widget build(BuildContext context) {
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
              ),
            ),
            ElevatedButton(
              onPressed: () {},
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
