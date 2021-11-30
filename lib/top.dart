import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat.dart';
import 'map.dart';
import 'nursecall.dart';
import 'profile.dart';

class TopWidget extends StatefulWidget {
  TopWidget({Key? key}) : super(key: key);

  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  String _counter = "";
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Shared Preferenceに値を保存されているデータを読み込んで_counterにセットする。
  _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 以下の「counter」がキー名。見つからなければ０を返す
    setState(() {
      _counter = prefs.getString('counter') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Drawer
      appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }),
          ),
          // タイトル名
          centerTitle: true, // タイトルの表示位置
          backgroundColor: Colors.white),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                '設定',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("プロフィール変更"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatPage(),
                    ));
              },
            ),
            ListTile(
              title: Text("ナースコール設定"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Nursecall(),
                    ));
              },
            ),
          ],
        ),
      ),

      key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                height: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    //ロゴ
                    Align(
                      alignment: AlignmentDirectional(0.5, -0.63),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                        child: Image.asset(
                          'img/sotukenLogo.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // ナースコールボタン
                    Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: SizedBox(
                          width: 200.0,
                          height: 120.0,
                          child: FloatingActionButton(
                              onPressed: _openPhoneApp,
                              backgroundColor: Colors.orange,
                              child: Icon(
                                Icons.local_phone_sharp,
                                size: 70,
                              ))),
                    ),

                    //Chatボタン
                    Align(
                      alignment: AlignmentDirectional(-0.88, 0.04),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChatPage(),
                              ));
                        },
                        child: ClipOval(
                            child: Image(
                          width: 140,
                          height: 140,
                          image: AssetImage('img/Chat-rafiki.png'),
                          fit: BoxFit.contain,
                        )),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.6, 0.34),
                      child: Text(
                        'Chat',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),

                    //MAPボタン
                    Align(
                      alignment: AlignmentDirectional(0.89, 0.04),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MapPage(),
                              ));
                        },
                        child: ClipOval(
                            child: Image(
                          width: 140,
                          height: 140,
                          image: AssetImage('img/Navigation-rafiki.png'),
                          fit: BoxFit.contain,
                        )),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.60, 0.34),
                      child: Text(
                        'MAP',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openPhoneApp() {
    var tel = '117';
    _launchURL(
      'tel:' + tel,
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      final Error error = ArgumentError('Could not launch $url');
      throw error;
    }
  }
}
