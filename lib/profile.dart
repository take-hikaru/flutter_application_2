import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ProfilePage extends StatefulWidget {
 
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfeelWidgetState createState() => _ProfeelWidgetState();

}

class _ProfeelWidgetState extends State<ProfilePage> {

  // String image = '';
  String name = '';
  String selfPr = '';


  TextEditingController _sContlloer = new TextEditingController();


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
     //取得
    FirebaseFirestore.instance
        .collection('users')
        .doc('user1')
        .get().then((value){
          
         setState(() {
           selfPr=value['selfPr'];        
         });
         _sContlloer = TextEditingController(text: selfPr);
        });

  }


  @override
  Widget build(BuildContext context) {

    //APPベース
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("プロフィール変更"),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: false,
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children:[

            //プロフィール写真
            Align(
              alignment: AlignmentDirectional(0.0, -0.90),
              child: Container(
                width: 200,
                height: 200,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/503/600',
                ),
              ),
            ),
            
            //ユーザー名
            Align(
              alignment: AlignmentDirectional(0.0, -0.24),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
                child: TextField(              
                  onChanged: (value){
                    name = value;
                  },
                  style: TextStyle(fontSize: 34),
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'ユーザ名',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  maxLength: 10,
                ),
              ),
            ),

            //自己PR
            Align(
              alignment: AlignmentDirectional(-0.17, 0.43),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextField( 
                  controller: _sContlloer,
                  onChanged: (value){
                      selfPr = value;          
                  },
                  textInputAction: TextInputAction.done,
                  style: TextStyle(fontSize: 19),
                  decoration: InputDecoration(
                    hintText: '自己PR',
                  ),                  
                  textAlign: TextAlign.start,
                  maxLines: 7,
                ),
              ),
            ),

            //保存ボタン
            Align(
              alignment: Alignment(0,0.90),
              child: ElevatedButton(
                child: Text('保存'),
                  onPressed: () async{

                    //保存
                    await FirebaseFirestore.instance
                      .collection('users')
                      .doc('user1')
                      .set({'name':name,'selfPr':selfPr});

                    var result  = await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('保存完了'),
                          content: Text('保存しました。'),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(minimumSize: Size(260,70), textStyle: TextStyle(fontSize: 28)),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }