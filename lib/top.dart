import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopWidget extends StatefulWidget {
  TopWidget({Key? key}) : super(key: key);

  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                height: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.76, 0.12),
                      child: Container(
                        width: 140,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.56, 0.26),
                      child: Text(
                        'Chat',
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.75, 0.04),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset(
                          'img/Chat-rafiki.png',
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.76, 0.12),
                      child: Container(
                        width: 140,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.22, -0.63),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                        child: Image.asset(
                          'img/sotukenLogo.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.81, 0.13),
                      child: Container(
                        width: 140,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.83, 0.04),
                      child: Image.asset(
                        'img/Navigation-rafiki.png',
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.61, 0.26),
                      child: Text(
                        'MAP',
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.8, 0.12),
                      child: InkWell(
                        child: Container(
                          width: 140,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
