import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String? message;
  final String? email;
  final Timestamp? messageDate;
  Message(  {required this.email,
    required this.message,required this.messageDate});
  factory Message.fromJson(jsonData){
    return Message(
        email: jsonData["emailAddress"],
        message: jsonData["message"],
        messageDate: jsonData["createAt"]);
  }
}