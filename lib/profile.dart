import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_2/main.dart';
import 'package:google_fonts/google_fonts.dart';


Future<void> profile() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase?.initializeApp();
  runApp(ProfilePage());
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfeelWidgetState createState() => _ProfeelWidgetState();
}

class _ProfeelWidgetState extends State<ProfilePage> {
  String uploadedFileUrl = '';
  bool _loadingButton2 = false;
  bool _loadingButton1 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();


  TextEditingController _textEditingController = TextEditingController();

  // //プロフィール(自己PR)を更新するとき
  // _onSubmitted(String content) {
  //   CollectionReference posts = FirebaseFirestore.instance.collection('users');
  //   posts.doc('user1').update({"selfPr": content});
  //   // /// 入力欄をクリアにする
  //   // _textEditingController.clear();
  // }

  //プロフィール(ユーザー名)を更新するとき
  _onSubmitted2(String content) {
    CollectionReference posts = FirebaseFirestore.instance.collection('users');
    posts.doc('user1').update({"name": content});
    // /// 入力欄をクリアにする
    // _textEditingController.clear();
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String name = '';
    String selfPr = '';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("プロフィール編集"),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: false,
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children:[

            //自己PR
            Align(
              alignment: AlignmentDirectional(-0.17, 0.29),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextField(
                   // controller: _textEditingController,
                  // onSubmitted: _onSubmitted,  
                  onChanged: (value){
                    selfPr = value;
                  },
                  style: TextStyle(fontSize: 17),
                  // controller: textController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: '自己PR',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),                  
                  textAlign: TextAlign.start,
                  maxLines: 6,
                ),
              ),
            ),
            
            
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
              alignment: AlignmentDirectional(0.0, -0.20),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
                child: TextField(
                  // controller: _textEditingController,
                  onSubmitted: _onSubmitted2,
                  onChanged: (value){
                    name = value;
                  },
                  style: TextStyle(fontSize: 28),
                  // controller: textController2,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'ユーザー名',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ),


            //保存ボタン
            Align(
              alignment: Alignment(0,0.90),
              child: ElevatedButton(
                // controller: _textEditingController,
                // onFieldSubmitted: _onSubmitted2,
                // enabled: true,
                child: Text('保存'),
                  onPressed: () async{
                    var result  = await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('保存完了'),
                          content: Text('ユーザー名を'+name+'に変更しました。'+'\n'+'自己PRを'+selfPr+'に変更しました。'),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(minimumSize: Size(260,70), textStyle: TextStyle(fontSize: 28)),
                ),
              )
            ],
          ),
        ),
      );
    }
  }