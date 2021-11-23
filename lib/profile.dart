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
  // TextEditingController textController1;
  bool _loadingButton1 = false;
  // TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // textController1 = TextEditingController();
    // textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("プロフィールページ"),
        // backgroundColor: FlutterFlowTheme.primaryColor,
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
              alignment: AlignmentDirectional(-0.17, 0.20),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextFormField(
                  style: TextStyle(fontSize: 17),
                  // controller: textController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: '自己PR',
                    // hintStyle: FlutterFlowTheme.bodyText1.override(
                    //   fontFamily: 'Poppins',
                    //   fontSize: 18,
                    // ),
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
                  // style: FlutterFlowTheme.bodyText1.override(
                  //   fontFamily: 'Poppins',
                  //   fontSize: 18,
                  // ),
                  textAlign: TextAlign.start,
                  maxLines: 6,
                ),
              ),
            ),


            // Align(
            //   alignment: AlignmentDirectional(-0.02, 0.9),
            //   child: FFButtonWidget(
            //     onPressed: () async {
            //       setState(() => _loadingButton1 = true);
            //       try {
            //         await showDialog(
            //           context: context,
            //           builder: (alertDialogContext) {
            //             return AlertDialog(
            //               title: Text('保存完了'),
            //               content: Text('保存しました。'),
            //               actions: [
            //                 TextButton(
            //                   onPressed: () =>
            //                       Navigator.pop(alertDialogContext),
            //                   child: Text('Ok'),
            //                 ),
            //               ],
            //             );
            //           },
            //         );
            //       } finally {
            //         setState(() => _loadingButton1 = false);
            //       }
            //     },
            //     text: '保存',
            //     options: FFButtonOptions(
            //       width: 270,
            //       height: 80,
            //       color: Color(0xFF0051FF),
            //       textStyle: FlutterFlowTheme.title1.override(
            //         fontFamily: 'Poppins',
            //         color: Colors.white,
            //         fontSize: 30,
            //         fontWeight: FontWeight.normal,
            //       ),
            //       borderSide: BorderSide(
            //         color: Colors.transparent,
            //         width: 30,
            //       ),
            //       borderRadius: 20,
            //     ),
            //     loading: _loadingButton1,
            //   ),
            // ),


            //プロフィール写真
            Align(
              alignment: AlignmentDirectional(0.0, -0.89),
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


            // Align(
            //   alignment: AlignmentDirectional(0.65, -0.39),
            //   child: FFButtonWidget(
            //     onPressed: () {
            //       print('Button pressed ...');
            //     },
            //     text: '+',
            //     options: FFButtonOptions(
            //       width: 40,
            //       height: 40,
            //       color: Color(0xFF28AAC2),
            //       textStyle: FlutterFlowTheme.subtitle2.override(
            //         fontFamily: 'Poppins',
            //         color: Colors.white,
            //         fontSize: 20,
            //       ),
            //       borderSide: BorderSide(
            //         color: Colors.transparent,
            //         width: 1,
            //       ),
            //       borderRadius: 30,
            //     ),
            //     loading: _loadingButton2,
            //   ),
            // ),


            //ユーザー名
            Align(
              alignment: AlignmentDirectional(0.0, -0.28),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
                child: TextFormField(
                  style: TextStyle(fontSize: 28),
                  // controller: textController2,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'ユーザー名',
                    // hintStyle: FlutterFlowTheme.title1.override(
                    //   fontFamily: 'Poppins',
                    //   fontSize: 28,
                    //   fontWeight: FontWeight.w500,
                    // ),
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
                  // style: FlutterFlowTheme.title1.override(
                  //   fontFamily: 'Poppins',
                  //   fontSize: 28,
                  //   fontWeight: FontWeight.w500,
                  // ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ),


            //保存ボタン
            Align(
              alignment: Alignment(0,0.80),
              child: ElevatedButton(
                child: Text('保存'),
                onPressed: (){},
                style: ElevatedButton.styleFrom(minimumSize: Size(260,70), textStyle: TextStyle(fontSize: 28),),
              ),
            )


          ],
        ),
      ),
    );
  }
}