import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:routier/forum/forum.dart';
import 'package:routier/menu.dart';
import 'package:routier/global.dart' as global;

Future<void> main() async {
  runApp(const CommuneSelect());
  await Firebase.initializeApp();
}

class CommuneSelect extends StatelessWidget {
  const CommuneSelect({Key? key}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Liste(), //Liste de commune
            const SizedBox(
              height: 50, //Espace
            ),
            OutlinedButton(
              //Boutton
              style: OutlinedButton.styleFrom(
                primary: const Color.fromRGBO(21, 106, 155, 1),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const Forum()));
              },
              child: const Text(
                'Ouvrir le forum',
              ),
            )
          ],
        )),
        drawer: const SideMenu());
  }
}

class Liste extends StatefulWidget {
  const Liste({Key? key}) : super(key: key);

  @override
  State<Liste> createState() => _Liste();
}

class _Liste extends State<Liste> {
  final listeCommune = [
    "abobo",
    "adjame",
    "anyama",
    "attecoube",
    "bingerville",
    "cocody",
    "koumassi",
    "marcory",
    "plateau",
    "port bouet",
    "songon",
    "treichville",
    "yopougon"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 150,
          child: Center(
            child: DropdownButtonFormField(
              value: global.valeurChoisie,
              icon: const Icon(Icons.arrow_drop_down_rounded),
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  global.valeurChoisie = newValue!;
                });
              },
              items: listeCommune.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
