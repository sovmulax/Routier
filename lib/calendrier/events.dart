import 'package:flutter/material.dart';
import 'package:routier/menu.dart';

void main() {
  runApp(const Event());
}

class Event extends StatelessWidget {
  const Event({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CALENDRIER'),
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
        children: const [WEvents(event: 'evane', date: '10, Décembre 2022', /*couleur: 'green',*/)],
      ),
      drawer: const SideMenu(),
    );
  }
}

class WEvents extends StatelessWidget {
  //const WEvents({Key? key}) : super(key: key);

  final String event;
  final String date;
  //final Color couleur;
  final String fontStyle = "Ubuntu";

  const WEvents({Key? key, required this.event, required this.date/*, required this.couleur*/}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            date,
                            style: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                fontFamily: fontStyle),
                          ),
                          Text(
                            event,
                            style: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.italic,
                                fontSize: 30,
                                fontFamily: fontStyle),
                          )
                        ],
                      ),
                      Container(
                        child: const Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.grey,
                          size: 30,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(
                                  10.0) //                 <--- border radius here
                              ),
                        ),
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 1,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.07,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.greenAccent,
                  width: 7.0,
                ),
              ),
            ))
      ],
    );
  }
}
