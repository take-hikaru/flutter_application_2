import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("プロフィールページ"),
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
                child: TextFormField(
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
                child: TextFormField(
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
                child: Text('保存'),
                onPressed: () async{
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
            )
          ],
        ),
      ),
    );
  }
}