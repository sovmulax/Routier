import 'package:flutter/material.dart';

class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _Forget();
}

class _Forget extends State<Forget> {
  final _keyForm = GlobalKey<FormState>();

  String email = '', message = '';
  bool errorEmail = false;
  final SnackBar _snackBar = const SnackBar(
    content: Text(
      "Mail de recupperation envoye",
      style: TextStyle(color: Color.fromRGBO(21, 106, 155, 1), fontSize: 18.0),
    ),
    duration: Duration(seconds: 5),
    backgroundColor: Colors.white,
    padding: EdgeInsets.all(10.0),
  );
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
              Navigator.pushNamed(context, '/connexion');
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
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          if (errorEmail) {
                            setState(() {
                              message = "Formulaire incomplet";
                            });
                          } else {
                            message = '';
                            ScaffoldMessenger.of(context)
                                .showSnackBar(_snackBar);
                            Navigator.pushNamed(context, '/connexion');
                          }
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Reccuperer mon compte",
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
