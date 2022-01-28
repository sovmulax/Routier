import 'package:flutter/material.dart';
import 'package:routier/connexion/connexion.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final _keyForm = GlobalKey<FormState>();

  String mdp = '',
      confMdp = '',
      email = '',
      message = '',
      nom = '',
      prenom = '';
  bool errorEmail = false,
      errorMdp = false,
      errorMdpConf = false,
      errorPass = false,
      errornom = false,
      errorprenom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(21, 106, 155, 1),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Connexion()));
            },
            icon: const Icon(Icons.arrow_back)),
      ),
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
                          hintText: 'latash',
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
                            errornom = true;
                          });
                        } else {
                          setState(() {
                            errornom = false;
                          });
                        }
                      },
                      onChanged: (val) => nom = val,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
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
                          hintText: '.inc',
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
                            errorprenom = true;
                          });
                        } else {
                          setState(() {
                            errorprenom = false;
                          });
                        }
                      },
                      onChanged: (val) => prenom = val,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
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
                      },
                      onChanged: (val) => email = val,
                    ),
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
                      },
                      onChanged: (val) => mdp = val,
                    ),
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
                        hintText: 'Confirmer mot de passe',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (val) {
                        if (mdp != confMdp) {
                          setState(() {
                            errorPass = true;
                          });
                        } else if (mdp == confMdp) {
                          errorPass = false;
                        } else if (val!.isEmpty) {
                          setState(() {
                            errorMdpConf = true;
                          });
                        } else {
                          setState(() {
                            errorMdpConf = false;
                          });
                        }
                      },
                      onChanged: (val) => confMdp = val,
                    ),
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
                          if (errorMdp ||
                              errorEmail ||
                              errorMdpConf ||
                              errornom ||
                              errorprenom) {
                            setState(() {
                              message = "Formulaire incomplet";
                            });
                          } else if (errorPass) {
                            setState(() {
                              message = "mots de passe incompatible";
                            });
                          } else {
                            message = '';
                            print(nom);
                            print(prenom);
                            print(email);
                            print(mdp);
                            print('confirme =>' + confMdp);
                            
                          }
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Inscription",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      )),
                ],
              )),
        ),
      ),
    );
  }
}
