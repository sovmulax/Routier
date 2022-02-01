import 'package:flutterfire_ui/auth.dart';
import 'package:routier/forum/api.dart';
import 'package:routier/menu.dart';
import 'package:routier/global.dart' as global;
import 'package:intl/intl.dart';

import 'package:firebase_core/firebase_core.dart';
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
      debugShowCheckedModeBanner: false,
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
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  global.valeurChoisie.toUpperCase(),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(
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
        padding: const EdgeInsets.all(15),
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
                        Icons.image,
                        size: 25.0,
                        color: Color.fromRGBO(21, 106, 155, 1),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: Form(
                              key: formKey,
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: const InputDecoration.collapsed(
                                  hintText: 'Message',
                                  border: InputBorder.none,
                                ),
                                controller: messageController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Votre message...";
                                  }
                                  return null;
                                },
                              ))),
                      const SizedBox(width: 18.0),
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
              nomUser: global.name,
              email: global.email.toString(),
              message: content,
              time: DateTime.now().millisecondsSinceEpoch.toString()));
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

  bool isLastMessage(int index, List<Message> message) {
    if (index == 0) return true;
    if (message[index].email != message[index - 1].email) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          //const SizedBox(height: 5),
          Flexible(
            child: StreamBuilder<List<Message>>(
              stream: messageRequete.recevoirMessage(global.valeurChoisie),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Message>> snapshot) {
                if (snapshot.hasData) {
                  List<Message> listMessage = snapshot.data ?? List.from([]);
                  return ListView.builder(
                    itemBuilder: (context, index) => TextMessage(
                        nomUser: listMessage[index].nomUser,
                        email: listMessage[index].email,
                        message: listMessage[index].message,
                        time: listMessage[index].time,
                        isLastMessage: isLastMessage(index, listMessage)),
                    itemCount: listMessage.length,
                    reverse: true,
                  );
                } else {
                  return const Center(
                      child: LoadingIndicator(size: 16, borderWidth: 2));
                }
              },
            ),
          ),
          //const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class Message {
  final String nomUser, email, message, time;

  Message({required this.nomUser, required this.message, required this.time, required this.email});

  Map<String, dynamic> toHashMap() {
    return {'nomUser': nomUser,'email': email, 'message': message, 'time': time};
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage(
      {Key? key,
      required this.nomUser,
      required this.message,
      required this.time,
      required this.email,
      required this.isLastMessage})
      : super(key: key);
  final String nomUser, message, time, email;
  final bool isLastMessage;
  final String profil = 'assets/images/logo.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          email != global.email
              ? Container()
              : SizedBox(
                  //width: 50,
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 5.0),
                      Text(
                        DateFormat.MMMd().add_Hm().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                int.parse(time))),
                        style: const TextStyle(
                          color: Color.fromRGBO(21, 106, 155, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
          Expanded(
            child: Container(
              alignment: global.email != email
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              margin: email != global.email
                  ? const EdgeInsets.only(
                      right: 15,
                    )
                  : const EdgeInsets.only(
                      left: 15,
                    ),
              child: messageWidget(),
            ),
          ),
          email != global.email
              ? SizedBox(
                  //width: 50,
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        DateFormat.MMMd().add_Hm().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                int.parse(time))),
                        style: const TextStyle(
                          color: Color.fromRGBO(21, 106, 155, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget messageWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          global.email != email
              ? Text(
                  nomUser,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                )
              : Container(),
          global.email != email ? const SizedBox(height: 5) : Container(),
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 7.0),
      width: 250.0,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(21, 106, 155, 1),
          borderRadius: global.email == email
              ? const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
      margin: const EdgeInsets.only(bottom: 5.0, right: 5.0, left: 5.0),
    );
  }
}
