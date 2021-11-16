import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("チャットページ"),
      ),
      body: Center(
        // Container(
        child: SizedBox(
          width: 200.0,
          height: 50.0,
          child: SignInButton(
            Buttons.Google,
            text: 'Sign up with Google',
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
