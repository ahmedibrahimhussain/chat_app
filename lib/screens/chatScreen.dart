import 'package:chat_app/controller/massage%20controller.dart';
import 'package:chat_app/models/default%20Text%20Form%20Field.dart';
import 'package:chat_app/models/messageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/RecipientMessage bady.dart';
import '../models/Sendermessage bady.dart';

class ChatScreen extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  @override
  Widget build(BuildContext context) {
    var emailAddress = ModalRoute.of(context)?.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy("createAt", descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    CupertinoIcons.chat_bubble_2_fill,
                    size: 45,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Chat App",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Lora"),
                  )
                ],
              ),
            ),
            body: GetX<MassageController>(
              init: MassageController(),
              builder: (controller) {
                return Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].email == emailAddress
                            ? SenderMassageBody(
                                message: messagesList[index],
                              )
                            : RecipientMassageBody(
                                message: messagesList[index],
                              );
                      },
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DefaultTextFormField(
                        radius: 0,
                        controller: controller.massageController.value,
                        type: TextInputType.text,
                        hintText: "send a massage",
                        suffixIcon: Icons.send,
                        borderWidth: 3,
                        suffixIconOnPressed: () {
                          print(emailAddress);
                          messages.add({
                            "message": controller.massageController.value.text,
                            "createAt": DateTime.now(),
                            "emailAddress": "$emailAddress"
                          });
                          controller.massageController.value.clear();

                          _controller.animateTo(
                            0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Center(
                  child: Text(
                    "Loading......",
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: "Lora",
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
