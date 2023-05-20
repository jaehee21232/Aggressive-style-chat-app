import 'dart:developer';
import 'package:chatapp/chatting/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputWidget extends ConsumerWidget {
  final TextEditingController controller;
  final String name;
  final String phonenumber;
  const InputWidget(
      {super.key,
      required this.controller,
      required this.name,
      required this.phonenumber});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              _onPressedSendButton(name, phonenumber);
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

  void _onPressedSendButton(String name, String phonenumber) async {
    try {
      MessageModel messageModel = MessageModel.fromMap(
          message: controller.text,
          date: DateTime.now().toString(),
          name: name,
          phonenumber: phonenumber);

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      print(messageModel.toMap().runtimeType);
      await firestore.collection("chatting").doc().set(messageModel.toMap());
    } catch (ex) {
      log('error', error: ex.toString(), stackTrace: StackTrace.current);
    }
  }
}
