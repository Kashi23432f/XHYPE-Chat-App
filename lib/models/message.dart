import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  late final String senderID;
  late final String senderEmail;
  late final String recieverID;
  late final String message;
  final Timestamp timestamp;

  Message({
    required this.senderID,
    required this.senderEmail,
    required this.recieverID,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': recieverID,
      'recieverID': recieverID,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
