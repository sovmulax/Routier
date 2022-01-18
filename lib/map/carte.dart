import 'package:flutter/material.dart';
import 'package:routier/menu.dart';

void main() {
  runApp(const Map());
}

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CARTE'),
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
            child: Image.asset('assets/images/logo.png', width: 50,),
            margin: const EdgeInsets.only(right: 20),
          )
        ],
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),

        backgroundColor: const Color.fromRGBO(21, 106, 155, 1),
      ),
      body: const Center(
        child: Text('Contenu de la page'),
      ),
      drawer: const SideMenu(),
    );
  }
}
