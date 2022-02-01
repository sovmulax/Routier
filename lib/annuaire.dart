// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:routier/menu.dart';
import 'package:url_launcher/url_launcher.dart';

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
      title: 'NUMEROS UTIL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Annuaire(),
    );
  }
}

class Annuaire extends StatefulWidget {
  const Annuaire({Key? key}) : super(key: key);

  @override
  _AnnuaireState createState() => _AnnuaireState();
}

class _AnnuaireState extends State<Annuaire> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  final CollectionReference _productss = FirebaseFirestore.instance
      .collection('routier')
      .doc('annuaire')
      .collection('items');

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
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
          'NUMEROS UTIL',
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
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      documentSnapshot['nom_service'],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 23,
                                          fontFamily: fontStyle),
                                    ),
                                    margin:
                                        const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  ),
                                  Text(
                                    documentSnapshot['num'].toString(),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 23,
                                        fontFamily: fontStyle),
                                  ),
                                  Container(
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.phone,
                                        color: Colors.grey,
                                        size: 30,
                                      ),
                                      color: Colors.white,
                                      onPressed: _hasCallSupport
                                          ? () => setState(() {
                                                _launched = _makePhoneCall(
                                                    documentSnapshot['num']
                                                        .toString());
                                              })
                                          : null,
                                    ),
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.09,
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                        ))
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
