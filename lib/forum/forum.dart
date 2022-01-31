// ignore_for_file: unnecessary_new
import 'package:loading/loading.dart';
import 'package:routier/forum/api.dart';
import 'package:routier/menu.dart';
import 'package:routier/global.dart' as global;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
}

class _BottomSectionState extends State<BottomSection> {
  final MessageAPI messageRequete = MessageAPI();
  final formKey = GlobalKey<FormState>();
  final messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
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
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(21, 106, 155, 1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: () => envoiMes(messageController.text),
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                    )),
              )
            ]),
      ),
    );
  }

  void envoiMes(String content) {
    if (content.trim() != '') {
      messageRequete.envoiMessage(
          global.valeurChoisie,
          Message(
            message: content,
            time: DateTime.now().millisecondsSinceEpoch.toString(),
            email: global.email,
          ));
      // listScrollController.animateTo(0.0,
      //     duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      messageController.clear();
    } else {
      Fluttertoast.showToast(msg: 'Rien à envoyer', textColor: Colors.red);
    }
  }
}

class ChatingSection extends StatefulWidget {
  const ChatingSection({Key? key}) : super(key: key);

  @override
  _ChatingSectionState createState() => _ChatingSectionState();
}

class _ChatingSectionState extends State<ChatingSection> {
  final MessageAPI messageRequete = MessageAPI();
  List<Map<dynamic, dynamic>> lists = [];

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
            Flexible(
              child: StreamBuilder<List<Message>>(
                stream: messageRequete.recevoirMessage(global.valeurChoisie),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Message>> snapshot) {
                  if (snapshot.hasData) {
                    List<Message> listMessage = snapshot.data ?? List.from([]);
                    return ListView.builder(
                      itemBuilder: (context, index) => TextMessage(
                          message: listMessage[index].message,
                          time: listMessage[index].time,
                          email: listMessage[index].email),
                      itemCount: listMessage.length,
                      reverse: true,
                    );
                  } else {
                    return Center(child: Loading());
                  }
                },
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String message, time, email;

  Message({required this.message, required this.time, required this.email});

  Map<String, dynamic> toHashMap() {
    return {'message': message, 'time': time, 'email': email};
  }
}

class TextMessage extends StatelessWidget {
  TextMessage(
      {Key? key,
      required this.message,
      required this.time,
      required this.email})
      : super(key: key);
  final String message, time, email;
  final String profil = 'assets/images/logo.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          email != global.email
              ? Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(profil),
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
                        time,
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
              margin: email != global.email
                  ? const EdgeInsets.only(
                      right: 25,
                    )
                  : const EdgeInsets.only(
                      left: 20,
                    ),
              padding:
                  const EdgeInsets.only(left: 6, top: 15, right: 6, bottom: 15),
              decoration: email != global.email
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
                crossAxisAlignment: email != global.email
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  email != global.email
                      ? Text(
                          email,
                          style: const TextStyle(
                            color: Colors.yellow,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : const SizedBox(height: 0),
                  email != global.email
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
          email != global.email
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
                        time,
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
          email != global.email
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
                      image: AssetImage(profil),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(),
          email == global.email
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
