import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('routier');

class Database {
  static Stream<QuerySnapshot> agenda() {
    CollectionReference agendaItemCollection =
        _mainCollection.doc('agendar').collection('items');

    return agendaItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> annuaire() {
    CollectionReference annuaireItemCollection =
        _mainCollection.doc('annuaire').collection('items');

    return annuaireItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> commune() {
    CollectionReference communeItemCollection =
        _mainCollection.doc('communes').collection('items');

    return communeItemCollection.snapshots();
  }

  late String nom = '';

  nameFound(String name) async {
    CollectionReference communeItemCollection =
        _mainCollection.doc('users').collection('items');

    var nam;
    var nam1;
    var nam2;
    var result = await _firestore
        .collection("routier")
        .doc('users')
        .collection('items')
        .where("email", isEqualTo: "$name")
        .get();
    result.docs.forEach((res) {
      nam = res.data();
      var nom = nam.toString();
      List<String> parts = nom.split(',');
      List<String> parts1 = parts[2].split(':');
      List<String> parts2 = parts[3].split(':');

      nam1 = parts1[1].toString();
      nam2 = parts2[1].toString();
    });
    nom = nam1 + ' ' + nam2;
    return nam1 + ' ' + nam2;
  }

  String get noms => nom;
}
