import 'package:flutter/material.dart';
import 'package:routier/actualit%C3%A9/fil.dart';
import 'package:routier/annuaire.dart';
import 'package:routier/calendrier/events.dart';
import 'package:routier/forum/communeSelect.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(21, 106, 155, 1),
            ),
            child: Text('Header'),
          ),
          ListTile(
            title: const Text('Actualité'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Fil()));
            },
          ),
          ListTile(
            title: const Text('Calendrier Routier'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Event()));
            },
          ),
          ListTile(
            title: const Text('Forum de Discussion'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const CommuneSelect()));
            },
          ),
          ListTile(
            title: const Text('Annuaire de Contact'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Annuaire()));
            },
          ),
          ListTile(
            title: const Text('Déconnexion'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Fil()));
            },
          ),
        ],
      ),
    );
  }
}
