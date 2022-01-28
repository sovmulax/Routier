import 'package:flutter/material.dart';
import 'package:routier/menu.dart';

import 'dart:async'; // new

import 'package:cloud_firestore/cloud_firestore.dart'; // new
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'firebase_options.dart';
// import 'src/authentication.dart';
// import 'src/widgets.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(const Forum());
}

class Forum extends StatelessWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FORUM'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              child: Image.asset(
                'assets/images/logo.png',
                width: 50,
              ),
              margin: const EdgeInsets.only(right: 20),
            )
          ],
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: const Color.fromRGBO(21, 106, 155, 1),
        ),
        body: Center(
          child: Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "NOM DE LA COMMUNE",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ChatPage(),
              ),
            ],
          ),
        ),
        drawer: const SideMenu());
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  Future<DocumentReference> addMessageToGuestBook(String message) {
    return FirebaseFirestore.instance.collection('forum').add(<String, dynamic>{
      'text': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'name': FirebaseAuth.instance.currentUser!.displayName,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: ChatingSection(),
      bottomNavigationBar: BottomSection(),
    );
  }
}

class BottomSection extends StatefulWidget {
  const BottomSection({Key? key}) : super(key: key);

  @override
  _BottomSectionState createState() => _BottomSectionState();

  addMessage(String text) {}
}

class _BottomSectionState extends State<BottomSection> {
  final formKey = GlobalKey<FormState>();
  final messageController = TextEditingController();

  void dispose() {
    messageController.dispose();
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(21, 106, 155, 1)),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.insert_emoticon,
                        size: 25.0,
                        color: Color.fromRGBO(21, 106, 155, 1),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: Form(
                              key: formKey,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Message"),
                                controller: messageController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Votre message...";
                                  }
                                  return null;
                                },
                              ))),
                      const SizedBox(width: 8.0),
                      const Icon(
                        Icons.image,
                        size: 25.0,
                        color: Color.fromRGBO(21, 106, 155, 1),
                      ),
                      const SizedBox(width: 10.0),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25),
                height: 45,
                width: 45,
                //color: Colors.white,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(21, 106, 155, 1),
                  shape: BoxShape.circle,
                ),
                child: const IconButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await widget.addMessage(messageController.text);
                        messageController.clear();
                      }
                    },
                    icon: Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                    )),
              )
            ]),
      ),
    );
  }
}

class ChatingSection extends StatelessWidget {
  final String senderProfile = 'assets/images/logo.png';
  final String receiverProfile = 'assets/images/logo.png';
  const ChatingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 45),
            TextMessage(
              message: "As tolerably recommend shameless",
              date: "17:10",
              senderProfile: senderProfile,
              senderName: "Luc G",
              isReceiver: 0,
              isDirect: 1,
            ),
            TextMessage(
              message: "She although cheerful perceive",
              date: "17:10",
              senderProfile: senderProfile,
              senderName: "Geoffroy",
              isReceiver: 1,
              isDirect: 0,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class TextMessage extends StatelessWidget {
  final String message, date, senderProfile, senderName;
  final int isReceiver, isDirect;

  const TextMessage({
    Key? key,
    required this.message,
    required this.date,
    required this.senderProfile,
    required this.senderName,
    required this.isReceiver,
    required this.isDirect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          isReceiver == 1 && isDirect == 0
              ? Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(senderProfile),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : SizedBox(
                  width: 60,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check,
                        color: Color.fromRGBO(21, 106, 155, 1),
                        size: 13.0,
                      ),
                      const SizedBox(width: 7.0),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Color.fromRGBO(21, 106, 155, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              margin: isReceiver == 1
                  ? const EdgeInsets.only(
                      right: 25,
                    )
                  : const EdgeInsets.only(
                      left: 20,
                    ),
              padding:
                  const EdgeInsets.only(left: 6, top: 15, right: 6, bottom: 15),
              decoration: isReceiver == 1
                  ? const BoxDecoration(
                      color: Color.fromRGBO(21, 106, 155, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(15),
                      ),
                    )
                  : const BoxDecoration(
                      color: Color.fromRGBO(21, 106, 155, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
              child: Column(
                crossAxisAlignment: isReceiver == 1
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  isReceiver == 1
                      ? Text(
                          senderName,
                          style: const TextStyle(
                            color: Colors.yellow,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : const SizedBox(height: 0),
                  isReceiver == 1
                      ? const SizedBox(height: 10)
                      : const SizedBox(height: 0),
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          isReceiver == 1 && isDirect == 0
              ? SizedBox(
                  width: 60,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check,
                        color: Color.fromRGBO(21, 106, 155, 1),
                        size: 13.0,
                      ),
                      const SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Color.fromRGBO(21, 106, 155, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          isDirect == 0 && isReceiver == 0
              ? Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 10,
                  ),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(senderProfile),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(),
          isReceiver == 0 && isDirect == 1
              ? Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 10,
                  ),
                  width: 45,
                  height: 45,
                )
              : Container(),
        ],
      ),
    );
  }
}
