import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:routier/actualit%C3%A9/fil.dart';
import 'package:routier/annuaire.dart';
import 'package:routier/calendrier/events.dart';
import 'package:routier/connexion/connexion.dart';
import 'package:routier/forum/commune_select.dart';
import 'package:routier/map/carte.dart';
import 'forum/commune_select.dart';
import 'package:routier/global.dart' as global;

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset('assets/images/logo.png'),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Text(
                  'John Doe',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontFamily: 'Ubuntu'),
                ),
                Text(
                  global.email,
                  style: const TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontFamily: 'Ubuntu'),
                ),
              ],
            ),
            decoration:
                const BoxDecoration(color: Color.fromRGBO(21, 106, 155, 1)),
          ),
          ListTile(
            title: const Text(
              'Map',
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontFamily: 'Ubuntu'),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Map()));
            },
          ),
          ListTile(
            title: const Text(
              'Actualité',
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontFamily: 'Ubuntu'),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Fil()));
            },
          ),
          ListTile(
            title: const Text('Calendrier Routier',
                style: TextStyle(
                    color: Colors.black, fontSize: 18, fontFamily: 'Ubuntu')),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Event()));
            },
          ),
          ListTile(
            title: const Text('Forum de Discussion',
                style: TextStyle(
                    color: Colors.black, fontSize: 18, fontFamily: 'Ubuntu')),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const CommuneSelect()));
            },
          ),
          ListTile(
            title: const Text('Annuaire de Contact',
                style: TextStyle(
                    color: Colors.black, fontSize: 18, fontFamily: 'Ubuntu')),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Annuaire()));
            },
          ),
          ListTile(
            title: const Text('Déconnexion',
                style: TextStyle(
                    color: Colors.black, fontSize: 18, fontFamily: 'Ubuntu')),
            onTap: () {
              global.isConnect = false;
              print(global.isConnect);

              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
              
            },
          ),
        ],
      ),
    );
  }
}
