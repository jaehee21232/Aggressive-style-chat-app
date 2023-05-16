import 'dart:developer';
import 'package:chatapp/chatting/model/message_model.dart';
import 'package:chatapp/common/const/data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  const InputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: "내용을 입력하세요..",
              ),
              controller: controller,
              keyboardType: TextInputType.multiline,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              _onPressedSendButton();
              print(controller.text);
            },
            child: Container(
              decoration: BoxDecoration(),
              width: 40,
              height: 40,
              child: Center(child: Icon(Icons.send)),
            ),
          )
        ]),
      ),
    );
  }

  void _onPressedSendButton() async {
    try {
      final name = storage.read(key: "name");
      MessageModel messageModel = MessageModel(
        message: controller.text,
        date: DateTime.now().toString(),
        name: name,
      );

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore
          .collection("chatting")
          .doc("tes")
          .set(messageModel.toMap());
    } catch (ex) {
      print(ex);
      log('error', error: ex.toString(), stackTrace: StackTrace.current);
    }
  }
}
