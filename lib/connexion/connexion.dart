import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:routier/database.dart';
import 'package:routier/map/carte.dart';
import 'forget.dart';
import 'inscription.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Connecter());
}

class Connecter extends StatelessWidget {
  const Connecter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Connexion',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const Connexion(),
      routes: <String, WidgetBuilder>{
        '/connexion': (BuildContext context) => const Connexion(),
        '/inscription': (BuildContext context) => const Inscription(),
        '/forget': (BuildContext context) => const Forget(),
      },
    );
  }
}

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);
  @override
  State<Connexion> createState() => _Connexion();
}

class _Connexion extends State<Connexion> {
  final _keyForm = GlobalKey<FormState>();
  String mdp = '', email = '', message = '';
  bool errorEmail = false, errorMdp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(21, 106, 155, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: MediaQuery.of(context).size.height,
          child: Form(
              key: _keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (errorMdp || errorEmail)
                    Text(
                      message,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0, color: Colors.transparent),
                        color: Colors.white),
                    child: TextFormField(
                        maxLines: 1,
                        minLines: 1,
                        style: const TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black54)),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.red)),
                            contentPadding: const EdgeInsets.all(20.0),
                            hintStyle: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                            hintText: 'exemple@gmail.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            )),
                        validator: (val) {
                          if (val!.isEmpty) {
                            setState(() {
                              errorEmail = true;
                            });
                          } else {
                            setState(() {
                              errorEmail = false;
                            });
                          }
                          email = val;
                        }),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0, color: Colors.transparent),
                        color: Colors.white),
                    child: TextFormField(
                        maxLines: 1,
                        minLines: 1,
                        style: const TextStyle(fontSize: 14),
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.black54)),
                          errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.red)),
                          contentPadding: const EdgeInsets.all(20.0),
                          hintStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                          hintText: 'Mot de passe',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            setState(() {
                              errorMdp = true;
                            });
                          } else {
                            setState(() {
                              errorMdp = false;
                            });
                          }
                          mdp = val;
                        }),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          if (errorMdp || errorEmail) {
                            setState(() {
                              message = "Formulaire incomplet";
                            });
                          } else {
                            final Stream<QuerySnapshot> conn =
                                Database.connexion();
                            print(conn.elementAt(1));
                            
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const Map()
                                )
                            );
                          }
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Connexion",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Forget()));
                      },
                      child: const Text(
                        "Mot de passe oublie",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Inscription()));
                      },
                      child: const Text(
                        "S'inscrire",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
