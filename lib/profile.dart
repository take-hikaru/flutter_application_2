import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePage extends StatefulWidget {
 
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfeelWidgetState createState() => _ProfeelWidgetState();

}

class _ProfeelWidgetState extends State<ProfilePage> {

  //変数
  File? image;
  final _picker = ImagePicker();

  String uid = FirebaseAuth.instance.currentUser!.uid;
  String name ='';
  String selfPr = '';

  TextEditingController _sContlloername = new TextEditingController();
  TextEditingController _sContlloerselfPr = new TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
     //取得
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get().then((value){
          
         setState(() {
           name = value['name'];
           selfPr = value['selfPr'];        
         });
          _sContlloername = TextEditingController(text: name);
          _sContlloerselfPr = TextEditingController(text: selfPr);
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

            // //プロフィール写真
            Align(
              alignment: AlignmentDirectional(0.0, -0.92),
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
              alignment: AlignmentDirectional(0.0, -0.25),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
                child: TextField( 
                  controller: _sContlloername,
                  onChanged: (value){
                      name = value;          
                  },
                  textInputAction: TextInputAction.done,
                  style: TextStyle(fontSize: 34),
                  decoration: InputDecoration(
                    hintText: 'ユーザー名',
                    border: InputBorder.none,
                  ),                  
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ),

            //自己PR
            Align(
              alignment: AlignmentDirectional(-0.17, 0.40),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextField( 
                  controller: _sContlloerselfPr,
                  onChanged: (value){
                      selfPr = value;          
                  },
                  textInputAction: TextInputAction.done,
                  style: TextStyle(fontSize: 19),
                  decoration: InputDecoration(
                    hintText: '自己PRを入力してください',
                  ),                  
                  textAlign: TextAlign.start,
                  maxLines: 7,
                ),
              ),
            ),

            //保存ボタン
            Align(
              alignment: Alignment(0,0.88),
              child: ElevatedButton(
                child: Text('保存'),
                  onPressed: () async{

                    //保存
                    if(name == ''){
                      showDialog(context: context, builder: (_){
                        return AlertDialog(
                          title: Text('保存失敗'),
                          content: Text('ユーザー名を入力してください'),
                           actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed:() => Navigator.of(context).pop(1),
                              ),
                            ],
                          );
                        }
                      );
                    }else if(selfPr == ''){
                      showDialog(context: context, builder: (_){
                        return AlertDialog(
                          title: Text('保存失敗'),
                          content: Text('自己PRを入力してください'),
                           actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed:() => Navigator.of(context).pop(1),
                              ),
                            ],
                          );
                        }
                      );
                    }else if(name != '' && selfPr != ''){
                    await FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .set({'name':name,'selfPr':selfPr});

                    var result  = await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('保存成功'),
                          content: Text('内容を保存しました。'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed:() => Navigator.of(context).pop(1),
                              ),
                            ],
                          );
                        },
                      );
                    }
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