// import 'package:cloud_firestore/cloud_firestore.dart';

// class ForumRepository {

//     final String FORUM_COLLECTION = "forum";
//     final String MESSAGE_COLLECTION = "messages";
//     ForumRepository instance;

//     ForumRepository();

//     ForumRepository getInstance() {
//         ForumRepository result = instance;
//         if (result != null) {
//             return result;
//         }
//         synchronized(ForumRepository.class) {
//             if (instance == null) {
//                 instance = new ForumRepository();
//             }
//             return instance;
//         }
//     }

//     public CollectionReference getChatCollection(){
//         return FirebaseFirestore.getInstance().collection(FORUM_COLLECTION);
//     }

//     Query getAllMessageForChat(String forum){
//         return this.getChatCollection()
//                 .document(forum)
//                 .collection(MESSAGE_COLLECTION)
//                 .orderBy("dateCreated")
//                 .limit(50);
//     }

// }