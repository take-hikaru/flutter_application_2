import 'package:flutter/material.dart';
import 'package:flutter_application_2/chat2.dart';
import 'package:flutter_application_2/chat3.dart';
import 'package:flutter_application_2/chat4.dart';
import 'package:flutter_application_2/chat5.dart';

import 'chat.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("チャットルーム"),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Container(
                  width: double.infinity,
                  child: Column(children: <Widget>[
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text('不眠症'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage('不眠症'),
                              ));
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text('喘息'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage2('喘息'),
                              ));
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text('がん'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage3('がん'),
                              ));
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text('てんかん'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage4('てんかん'),
                              ));
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text('コロナ'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage5('コロナ'),
                              ));
                        },
                      ),
                    ),
                  ])))),
    );
  }
}
