import 'package:flutter/material.dart';

import 'messageModel.dart';

class SenderMassageBody extends StatelessWidget {
  SenderMassageBody({
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
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular( topLeftRadius ?? 20),
                bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
                bottomRight: Radius.circular(bottomRightRadius ??20),
                topRight: Radius.circular(topRightRadius ?? 20),
              ),
              color: const Color.fromRGBO(34, 150, 242, 1.0)),
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
