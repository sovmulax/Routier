import 'package:flutter/material.dart';
import 'forget.dart';
import 'inscription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Connexion',
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: const Connexion(),
      routes: <String, WidgetBuilder>{
        '/connexion': (BuildContext context) => const Connexion(),
        '/inscription' : (BuildContext context) => const Inscription(),
        '/forget' : (BuildContext context) => const Forget(),
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
                  if(errorMdp || errorEmail)
                    const Text("Formulaire incomplet", style: TextStyle(color: Colors.red, fontSize: 15.0, ), textAlign: TextAlign.center,),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 0, color: Colors.transparent),
                        color: Colors.white
                    ),
                    child: TextFormField(
                        maxLines: 1,
                        minLines: 1,
                        style: const TextStyle(
                            fontSize: 25.0
                        ),
                        decoration:  InputDecoration(
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.black54
                                )
                            ),
                            errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.red
                                )
                            ),
                            contentPadding: const EdgeInsets.all(20.0),
                            hintStyle: const TextStyle(
                              color: Colors.black54,
                              fontSize: 20.0,
                            ),
                          hintText: 'exemple@gmail.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          )
                      ),
                      validator: (val) {
                        if(val!.isEmpty){
                          setState(() {
                            errorEmail = true;
                          });
                        }
                        else
                          {
                            setState(() {
                              errorEmail = false;
                            });
                          }
                      }
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 0, color: Colors.transparent),
                      color: Colors.white
                    ),
                    child: TextFormField(
                      maxLines: 1,
                      minLines: 1,
                      style: const TextStyle(
                          fontSize: 25.0
                      ),
                      obscureText: true,
                      decoration:  InputDecoration(
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black54
                          )
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.red
                          )
                        ),
                        contentPadding: const EdgeInsets.all(20.0),
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                          fontSize: 20.0,
                        ),
                          hintText: 'Mot de passe',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                      ),
                      validator: (val) {
                        if(val!.isEmpty)
                          {
                            setState(() {
                              errorMdp = true;
                            });
                          }
                        else
                          {
                            setState(() {
                              errorMdp = false;
                            });
                          }
                      }
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                      onPressed: (){
                        if(_keyForm.currentState!.validate())
                        {
                          //Connexion
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Connexion",
                          style: TextStyle(
                              fontSize: 20.0,
                            color: Colors.white
                          ),
                        ),
                      )
                  ),
                  const SizedBox(height: 10.0,),
                  TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/forget');
                      },
                      child: const Text("Mot de passe oublie",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                        ),
                      )
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/inscription');
                      },
                      child: const Text("S'inscrire",
                        style: TextStyle(
                            color: Colors.black54,
                          fontSize: 18.0,
                        ),
                      )
                  )
                ],
              )
          ),
          ),
      ),
      );
  }
}
