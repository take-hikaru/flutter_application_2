import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ChatPage());
}

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '不眠症的な病気'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textEditingController = TextEditingController();

  List<String> messages = []; //入力されたメッセージを保存するリスト

  List<String> dates = []; //送信した時間を保存するリスト

  String uid = FirebaseAuth.instance.currentUser!.uid;

  // 作成したドキュメント一覧
  List<DocumentSnapshot> documentList = [];

  // 指定したドキュメントの情報
  String orderDocumentInfo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(widget.title),
      ),
      backgroundColor: Colors.blue[100],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _SentMessageWidget(
                  //_SentMessageWidgetに返す
                  message: messages[index], //dateにdatesを代入
                  date: dates[index],
                );
              },
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      cursorColor: Colors.black,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.send,
                      size: 20,
                    ),
                    color: Colors.blue,
                    onPressed: () async {
                      var document = null;
                      document = await FirebaseFirestore.instance
                          .collectionGroup('category1')
                          .get();

                      var test = document.docs;

                      for (var snapshot in test) {
                        debugPrint(snapshot.data()['content']);
                        debugPrint(snapshot.data()['createdAt'].toString());
                      }

                      //.debugPrint("あああああああああ" + document.toString());

                      DateFormat _formatter = DateFormat("yyyy:M:d:H:mm");
                      DateFormat _formatter2 = DateFormat("H:mm");

                      var msg = _textEditingController.text.trim();

                      var dateadd = _formatter.format(DateTime.now());
                      var dateadd2 = _formatter2.format(DateTime.now());

                      if (msg.isEmpty) {
                        return;
                      }
                      messages.add(msg);

                      dates.add(dateadd2);

                      await FirebaseFirestore.instance
                          .collection('users') // コレクションID
                          .doc(uid) // ドキュメントID << usersコレクション内のドキュメント
                          .collection('category1') // サブコレクションID
                          .doc() // ドキュメントID << サブコレクション内のドキュメント
                          .set({
                        'content': msg,
                        'createdAt': FieldValue.serverTimestamp(), //サーバーサイドの時間
                        'userRef': '/users/' + uid
                      }); // データ

                      _textEditingController.clear();

                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _ReceivedMessageWidget extends StatelessWidget {
//   final String message;

//   final String date;
//   _ReceivedMessageWidget({required this.message, required this.date});

//   DateFormat formatter = DateFormat("HH:mm");

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CircleAvatar(),
//           const SizedBox(width: 5),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Column(
//                 children: [
//                   const SizedBox(height: 5),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 5,
//                       horizontal: 10,
//                     ),
//                     constraints: BoxConstraints(
//                       maxWidth: MediaQuery.of(context).size.width * 0.6,
//                     ),
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: Text(
//                       message,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(width: 5),
//               Text(
//                 date,
//                 style: const TextStyle(fontSize: 10),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class _SentMessageWidget extends StatelessWidget {
  final String message;

  final String date;
  _SentMessageWidget({required this.message, required this.date});

  final _formatter = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            date,
            style: const TextStyle(fontSize: 10),
          ),
          const SizedBox(width: 5),
          Column(
            children: [
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6,
                ),
                decoration: const BoxDecoration(
                  color: Colors.lightGreenAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  message,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
