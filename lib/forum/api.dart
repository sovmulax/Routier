import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:routier/forum/forum.dart';

class MessageAPI {
  List<Message> _messageListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return _messageFromSnapshot(doc);
    }).toList();
  }

  Message _messageFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("Message non trouvé");
    return Message(
        message: data['message'], time: data['time'], email: data['email']);
  }

  Stream<List<Message>> recevoirMessage(String commune) {
    return FirebaseFirestore.instance
        .collection("routier")
        .doc("forum")
        .collection(commune)
        .orderBy('time', descending: true)
        .snapshots()
        .map(_messageListFromSnapshot);
  }

  void envoiMessage(String commune, Message message) {
    var referenceDocument = FirebaseFirestore.instance
        .collection("routier")
        .doc("forum")
        .collection(commune)
        .doc();

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(referenceDocument, message.toHashMap());
    });
  }
}
