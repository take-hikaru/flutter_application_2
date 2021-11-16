import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(-0.02, 0.22),
              child: Text(
                'こんにちは！\n',
                // style: FlutterFlowTheme.bodyText1,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -0.77),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  'img/OnlineDoctorRafiki.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.6),
              child: SizedBox(
                width: 200.0,
                height: 50.0,
                child: SignInButton(
                  Buttons.Google,
                  text: 'Sign up with Google',
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
