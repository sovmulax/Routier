import 'package:flutter/material.dart';
import 'package:routier/menu.dart';

import 'details.dart';

void main() {
  runApp(const Fil());
}

class Fil extends StatelessWidget {
  const Fil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ACTUALITÉ'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final grayyy = const Color(0xFFEAFDFD);
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
          children: const [Publication(), Publication(), Publication()],
        ),
        drawer: const SideMenu());
  }
}

class Publication extends StatelessWidget {
  final String title = "Intitulé de l'article";
  final String entite = "Entité concerné";
  final String time = "15min";
  final String fontStyle = "Ubuntu";

  const Publication({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                          builder: (BuildContext context) => const Article()));
                },
                child: Container(
                  child: Image.asset('assets/images/octocat.png', height: 300),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.width * 0.6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 40,
                      fontFamily: fontStyle),
                ),
                width: MediaQuery.of(context).size.width * 1,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child:
                          Image.asset('assets/images/octocat.png', height: 70),
                      margin: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        entite + " - " + time,
                        style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                            fontSize: 30,
                            fontFamily: fontStyle),
                      ),
                      width: MediaQuery.of(context).size.width * 0.7,
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
  }
}
