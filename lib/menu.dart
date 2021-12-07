import 'package:flutter/material.dart';
import 'package:routier/actualit%C3%A9/fil.dart';
import 'package:routier/annuaire.dart';
import 'package:routier/calendrier/events.dart';
import 'package:routier/forum.dart';

class SideMenu extends StatelessWidget{
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
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Fil()));
              },
            ),
            ListTile(
              title: const Text('Calendrier Routier'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Event()));
              },
            ),
            ListTile(
              title: const Text('Forum de Discussion'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Forum()));
              },
            ),
            ListTile(
              title: const Text('Annuaire de Contact'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Annuaire()));
              },
            ),
            ListTile(
              title: const Text('Déconnexion'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Fil()));
              },
            ),
          ],
        ),
    );
  }
}