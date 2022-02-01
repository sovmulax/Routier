// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:routier/calendrier/details.dart';
import 'package:routier/menu.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Event',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Event(),
    );
  }
}

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  final CollectionReference _productss = FirebaseFirestore.instance
      .collection('routier')
      .doc('agendar')
      .collection('items');

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
          'Agenda',
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
                Color couleur = Colors.teal;
                switch (documentSnapshot['type']) {
                  case 1:
                    couleur = Colors.green;
                    break;
                  case 2:
                    couleur = Colors.orange;
                    break;
                  case 3:
                    couleur = Colors.red;
                    break;
                  default:
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        documentSnapshot['date'],
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            fontFamily: fontStyle),
                                      ),
                                      Text(
                                        documentSnapshot['titre'],
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 24,
                                            fontFamily: fontStyle),
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Detail(
                                                      text:
                                                          documentSnapshot[
                                                              'description'],
                                                      source: documentSnapshot[
                                                          'source'],
                                                      ville: documentSnapshot[
                                                          'lieux'])));
                                    },
                                    child: Container(
                                      child: const Icon(
                                        Icons.arrow_right_alt_rounded,
                                        color: Colors.grey,
                                        size: 30,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                                10.0) //                 <--- border radius here
                                            ),
                                      ),
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                    ),
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 1,
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.07,
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: couleur,
                              width: 7.0,
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
