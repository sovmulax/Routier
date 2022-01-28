import 'package:flutter/material.dart';
import 'package:routier/actualit%C3%A9/fil.dart';
import 'package:routier/menu.dart';

class Article extends StatelessWidget {
  final String titre;
  final String image;
  final String text;
  final String source;
  const Article(
      {Key? key,
      required this.titre,
      required this.image,
      required this.text,
      required this.source})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Article',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          title: "ACTUALITÉ - ARTICLE",
          titres: titre,
          images: image,
          texts: text,
          sources: source),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final String titres;
  final String images;
  final String texts;
  final String sources;
  const MyHomePage(
      {Key? key,
      required this.title,
      required this.titres,
      required this.images,
      required this.texts,
      required this.sources})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const Fil())),
        ),
        backgroundColor: const Color.fromRGBO(21, 106, 155, 1),
      ),
      body:
          DetailPub(titre: titres, image: images, text: texts, source: sources),
      drawer: const SideMenu(),
    );
  }
}

class DetailPub extends StatelessWidget {
  final String fontStyle = "Ubuntu";
  final String titre;
  final String image;
  final String text;
  final String source;
  const DetailPub(
      {Key? key,
      required this.titre,
      required this.image,
      required this.text,
      required this.source})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  titre,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 24,
                      fontFamily: fontStyle),
                ),
                width: MediaQuery.of(context).size.width * 1,
              ),
              const SizedBox(height: 20),
              Container(
                child: Image.network(image, fit: BoxFit.fill, height: 300),
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
              ),
              Container(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      fontFamily: fontStyle),
                ),
                width: MediaQuery.of(context).size.width * 0.90,
                margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              ),
              const SizedBox(height: 10),
              Container(
                child: Text(
                  "Source : $source",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      fontFamily: fontStyle),
                ),
                width: MediaQuery.of(context).size.width * 0.98,
                margin: const EdgeInsets.fromLTRB(2, 40, 10, 0),
              ),
              const SizedBox(height: 10),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 5),
          width: MediaQuery.of(context).size.width * 1,

          //color: grayyy,
        )
      ],
    );
  }
}
