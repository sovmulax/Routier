import 'package:flutter/material.dart';
import 'package:routier/menu.dart';

void main() {
  runApp(const Forum());
}

class Forum extends StatelessWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FORUM'),
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
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "NOM DE LA COMMUNE",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: MessageSection(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.create,
          ),
          backgroundColor: const Color.fromRGBO(21, 106, 155, 1),
        ),
        drawer: const SideMenu());
  }
}

class MessageSection extends StatelessWidget {
  MessageSection({Key? key}) : super(key: key);

  final List messages = [
    {
      'senderProfile': 'assets/images/logo.png',
      'senderName': 'Luc G',
      'message': 'Salut comment tu vas ?',
      'date': '16:30',
    },
    {
      'senderProfile': 'assets/images/logo.png',
      'senderName': 'Luc G',
      'message': 'Salut comment tu vas ?',
      'date': '16:30',
    },
    {
      'senderProfile': 'assets/images/logo.png',
      'senderName': 'Luc G',
      'message': 'Salut comment tu vas ?',
      'date': '16:30',
    },
    {
      'senderProfile': 'assets/images/logo.png',
      'senderName': 'Luc G',
      'message': 'Salut comment tu vas ?',
      'date': '16:30',
    },
    {
      'senderProfile': 'assets/images/logo.png',
      'senderName': 'Luc G',
      'message': 'Salut comment tu vas ?',
      'date': '16:30',
    },
    {
      'senderProfile': 'assets/images/logo.png',
      'senderName': 'Luc G',
      'message': 'Salut comment tu vas ?',
      'date': '16:30',
    },
    {
      'senderProfile': 'assets/images/logo.png',
      'senderName': 'Luc G',
      'message': 'Salut comment tu vas ?',
      'date': '16:30',
    },
    {
      'senderProfile': 'assets/images/logo.png',
      'senderName': 'Luc G',
      'message': 'Salut comment tu vas ?',
      'date': '16:30',
    },
    {
      'senderProfile': 'assets/images/logo.png',
      'senderName': 'Luc G',
      'message': 'Salut comment tu vas ?',
      'date': '16:30',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: messages.map((messages) {
          return InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 10, top: 15),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            messages['senderProfile'],
                          ),
                        )),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                messages['senderName'],
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    messages['message'],
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [Text(messages['date'])],
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      Container(
                        color: Colors.grey[400],
                        height: 0.5,
                      )
                    ],
                  )),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
