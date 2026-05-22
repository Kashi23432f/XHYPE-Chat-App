import 'package:chat_app/models/message.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // instance of firebasefirestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _auth = AuthService();

  // get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // go through each user
        final user = doc.data();

        // return user to us
        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String recieverID, String message) async {
    // get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    // create new message
    Message newMessage = Message(
      senderID: currentUserID, // Fixed: Swapped to match ID
      senderEmail: currentUserEmail, // Fixed: Swapped to match Email
      recieverID: recieverID,
      message: message,
      timestamp: timestamp,
    );

    // construct chat room id for two user
    List<String> ids = [currentUserID, recieverID];
    ids.sort(); // sort the ids
    String chatroomID = ids.join('_');

    // add new messag eto database
    await _firestore
        .collection("chat_room")
        .doc(chatroomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  // get message
  Stream<QuerySnapshot> getMessages(String UserID, otherUserID) {
    List<String> ids = [UserID, otherUserID];
    ids.sort(); // sort the ids
    String chatroomID = ids.join('_');

    return _firestore
        .collection("chat_room")
        .doc(chatroomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
