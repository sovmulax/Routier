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

}
