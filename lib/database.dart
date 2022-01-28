import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:routier/forum/commune_select.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('routier');

class Database {

  static Future<void> inscription({
    required String nom,
    required String prenom,
    required String email,
    required String mdp,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc('users').collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "email": email,
      "nom": nom,
      "prenom": prenom,
      "password": mdp,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Rien a été ajouter"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> connexion() {
    CollectionReference connexionItemCollection =
        _mainCollection.doc('users').collection('items');

    return connexionItemCollection.snapshots();
  }

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
