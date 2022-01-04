import 'package:flutter/material.dart';
import 'package:routier/menu.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Annuaire());
}

class Annuaire extends StatelessWidget {
  const Annuaire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Annuaire',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ANNUAIRE DE CONTACT'),
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
      body: ListView(
        children: const [Contact(), Contact(), Contact()],
      ),
      drawer: const SideMenu(),
    );
  }
}

class Contact extends StatelessWidget {
  final String service = "Police";
  final String numero = "100";

  final String fontStyle = "Ubuntu";

  const Contact({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          service,
                          style: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: 30,
                              fontFamily: fontStyle),
                        ),
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      ),
                      Text(
                        numero,
                        style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                            fontSize: 30,
                            fontFamily: fontStyle),
                      ),
                      Container(
                        child: const Icon(
                          Icons.phone,
                          color: Colors.grey,
                          size: 30,
                        ),
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.09,
            margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            )
        )
      ],
    );
  }
}
