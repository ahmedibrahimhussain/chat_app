import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 2),
      ),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  const [
                            Icon(CupertinoIcons.chat_bubble_2_fill,size: 150,)
                          ],
                        ),
                        Text(
                          "Chat App",
                          style: TextStyle(
                            fontFamily: "Lora",
                            fontSize: 40,
                            color: Get.isDarkMode
                                ? const Color.fromRGBO(
                                253, 253, 253, 1.0)
                                : const Color.fromRGBO(
                                1, 29, 33, 1.0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : LoginScreen();
      },
    ));
  }
}
