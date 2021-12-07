import 'package:flutter/material.dart';
import 'package:routier/annuaire.dart';
import 'package:routier/calendrier/events.dart';
import 'package:routier/forum.dart';
import 'package:routier/menu.dart';

import 'fil.dart';

void main() {
  runApp(Article());
}

class Article extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Article',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ACTUALITÉ - ARTICLE'),
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
