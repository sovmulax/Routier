import 'package:flutter/material.dart';
import 'package:routier/menu.dart';

void main() {
  runApp(const Detail());
}

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CALENDRIER - DÉTAILS'),
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
      body: Column(
        children: const [
          Text(
            "Détails de l'Evenement",
            style: TextStyle(
                color: Colors.black87,
                fontStyle: FontStyle.normal,
                fontSize: 40,
                fontFamily: 'Ubuntu'),
          ),
          CDetail()
        ],
      ),
      drawer: const SideMenu(),
    );
  }
}

class CDetail extends StatelessWidget {
  final String title = "Détails de l'Evenement";
  final String text =
      "Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son  Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son ange et délivré ses serviteurs qui ont eu  en lui, et qui ont violé l'ordre du roi et livréleur corps plutôt que de servir et d'adorer aucun autre dieu que leur Dieu !";
  final String source = "Source : XXXXXX XXX XXXXX";
  final String fontStyle = "Ubuntu";

  const CDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                child: Text(
                  "Zone Concerné",
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontFamily: fontStyle),
                ),
                width: MediaQuery.of(context).size.width * 0.98,
                margin: const EdgeInsets.fromLTRB(2, 40, 0, 0),
              ),
              Container(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontFamily: fontStyle),
                ),
                width: MediaQuery.of(context).size.width * 0.90,
                margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              ),
              Container(
                child: Text(
                  source,
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 25,
                      fontFamily: fontStyle),
                ),
                width: MediaQuery.of(context).size.width * 0.98,
                margin: const EdgeInsets.fromLTRB(2, 40, 0, 0),
              ),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 5),
          //color: grayyy,
        )
      ],
    );
  }
}