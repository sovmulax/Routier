import 'package:flutter/material.dart';
import 'package:routier/actualit%C3%A9/fil.dart';
import 'package:routier/calendrier/events.dart';
import 'package:routier/forum.dart';
import 'package:routier/menu.dart';

void main() {
  runApp(Annuaire());
}

class Annuaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Annuaire',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ANNUAIRE DE CONTACT'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            child: Image.asset('assets/images/logo.png', width: 50,),
            margin: EdgeInsets.only(right: 20),
          )
        ],
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),

        backgroundColor: Color.fromRGBO(21, 106, 155, 1),
      ),
      body: const Center(
        child: Text('Contenu de la page'),
      ),
      drawer: SideMenu(),
    );
  }
}
