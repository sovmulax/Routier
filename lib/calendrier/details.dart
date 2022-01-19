import 'package:flutter/material.dart';
import 'package:routier/calendrier/events.dart';

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
      home: const MyHomePage(title: "Détails de l'Evenement"),
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
        title: Text(
          title,
          textAlign: TextAlign.left,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const Event())),
        ),
        backgroundColor: const Color.fromRGBO(21, 106, 155, 1),
      ),
      body: ListView(
        children: const [CDetail()],
      ),
      drawer: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const Event()));
        },
        child: Container(
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.grey,
            size: 30,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(
                Radius.circular(10.0) //                 <--- border radius here
                ),
          ),
          margin: const EdgeInsets.fromLTRB(0, 10, 365, 10),
        ),
      ),
    );
  }
}

class CDetail extends StatelessWidget {
  final String title = "Détails de l'Evenement";
  final String text =
      "Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son  Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego,Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son  Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son Nebucadnetsar prit la parole et dit : Béni soit le Dieu de Schadrac, de Méschac et d'Abed Nego, lequel a envoyé son ange et délivré ses serviteurs qui ont eu  en lui, et qui ont violé l'ordre du roi et livréleur corps plutôt que de servir et d'adorer aucun autre dieu que leur Dieu !";
  final String source = "Source : XXXXXX XXX XXXXX";
  final String fontStyle = "Ubuntu";

  const CDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  "\tZone Concerné",
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      fontFamily: fontStyle),
                ),
                width: MediaQuery.of(context).size.width * 0.98,
              ),
              Container(
                child: Text(
                  "- Koumassi \n - Marcory",
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      fontFamily: fontStyle),
                ),
                width: MediaQuery.of(context).size.width * 0.95,
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              ),
              Container(
                child: Text(
                  "Détails",
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: fontStyle),
                ),
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              ),
              Container(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
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
                      fontSize: 16,
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
