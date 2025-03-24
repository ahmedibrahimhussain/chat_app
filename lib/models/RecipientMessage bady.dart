import 'package:flutter/material.dart';

import 'messageModel.dart';

class RecipientMassageBody extends StatelessWidget {
  RecipientMassageBody({
    this.bottomRightRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.topLeftRadius,
    required this.message,
  });

  double? topLeftRadius;
  double? bottomLeftRadius;
  double? bottomRightRadius;
  double? topRightRadius;
  Message message;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular( topLeftRadius ?? 20),
                bottomLeft: Radius.circular(bottomLeftRadius ??20),
                bottomRight: Radius.circular(bottomRightRadius ??0),
                topRight: Radius.circular(topRightRadius ?? 20),
              ),
              color: const Color.fromRGBO(15, 3, 63, 1.0)),
          child: Column(children: [
            Text(
              message.message??"",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),

          ],),
        ),),
    );
  }
}
