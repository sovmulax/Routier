import 'package:flutter/material.dart';
import 'package:routier/forum/forum.dart';
import 'package:routier/menu.dart';

void main() {
  runApp(const CommuneSelect());
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
              //Espace
              height: 50,
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
  String valeurChoisie = 'Cocody';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: valeurChoisie,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      elevation: 16,
      underline: Container(
        height: 2,
        color: const Color.fromRGBO(21, 106, 155, 1),
      ),
      onChanged: (String? newValue) {
        setState(() {
          valeurChoisie = newValue!;
        });
      },
      items: <String>['Cocody', 'Adjamé', 'Treichville']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        );
      }).toList(),
    );
  }
}
