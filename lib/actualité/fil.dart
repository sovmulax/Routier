// main.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:routier/actualit%C3%A9/details.dart';
import 'package:routier/calendrier/details.dart';
import 'package:routier/connexion/connexion.dart';
import 'package:routier/menu.dart';
import 'package:routier/global.dart' as global;
import 'package:flutter/scheduler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FIL',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Fil(),
        routes: <String, WidgetBuilder>{
          "login": (BuildContext context) => const Connexion(),
        });
  }
}

class Fil extends StatefulWidget {
  const Fil({Key? key}) : super(key: key);

  @override
  _FilState createState() => _FilState();
}

class _FilState extends State<Fil> {
  final CollectionReference _productss = FirebaseFirestore.instance
      .collection('routier')
      .doc('actualité')
      .collection('items');

  @override
  void initState() {
    if (global.isConnect == false) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed("login");
      });
    }
    print(global.isConnect);
    super.initState();
  }

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
        title: const Text(
          'ACTUALITÉ',
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromRGBO(21, 106, 155, 1),
      ),
      body: StreamBuilder(
        stream: _productss.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                String fontStyle = "Ubuntu";
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Article(
                                              titre: documentSnapshot["titre"],
                                              image: documentSnapshot['image'],
                                              text: documentSnapshot[
                                                  'description'],
                                              source:
                                                  documentSnapshot['source'])));
                            },
                            child: Container(
                              child: Image.network(documentSnapshot["image"],
                                  fit: BoxFit.fill, height: 300),
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.width * 0.6,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              documentSnapshot["titre"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 24,
                                  fontFamily: fontStyle),
                            ),
                            width: MediaQuery.of(context).size.width * 1,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                      documentSnapshot["sourceImage"],
                                      height: 50,
                                      fit: BoxFit.cover),
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    documentSnapshot["source"],
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 18,
                                        fontFamily: fontStyle),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width * 1,
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                      //color: grayyy,
                    )
                  ],
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      drawer: const SideMenu(),
    );
  }
}
