import 'package:flutter/material.dart';
import 'package:routier/calendrier/events.dart';

class Detail extends StatelessWidget {
  final String ville;
  final String text;
  final String source;
  const Detail(
      {Key? key, required this.text, required this.source, required this.ville})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Det(
        title: "Détails de l'Evenement",
        texts: text,
        sources: source,
        villes: ville,
      ),
    );
  }
}

class Det extends StatelessWidget {
  final String title;
  final String villes;
  final String texts;
  final String sources;
  const Det(
      {Key? key,
      required this.title,
      required this.texts,
      required this.sources,
      required this.villes})
      : super(key: key);
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
      body: CDetail(text: texts, source: sources, ville: villes),
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
  final String ville;
  final String text;
  final String source;
  final String fontStyle = "Ubuntu";
  const CDetail(
      {Key? key, required this.text, required this.source, required this.ville})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var city = "";
    List<String> list = ville.split(',');
    for (var q = 0; q < list.length; q++) {
      city = (list.length > 0 ? (city + " \n ") : city) + (list[q]);
    }
    print(city);

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
                  city,
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
                  "Source : $source",
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
