import 'dart:async';
import 'dart:developer';

import 'package:chatapp/chatting/component/input_widget.dart';
import 'package:chatapp/chatting/model/message_model.dart';
import 'package:chatapp/common/const/font_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamMessages extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final String phonenumber;
  const StreamMessages(
      {super.key,
      required this.controller,
      required this.name,
      required this.phonenumber});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: streamMessages(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messages = snapshot.data!;
          return ListView.builder(
            reverse: true,
            shrinkWrap: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  messages[index].name,
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        messages[index].message,
                        style: messageText,
                      ),
                      Text(
                        "${messages[index].date.split(" ")[0].substring(5)} ${messages[index].date.split(" ")[1].substring(0, 5)}",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
              child: Text(
            "데이터 없음",
            style: TextStyle(color: Colors.black),
          ));
        }
      },
    );
  }

  Stream<List<MessageModel>> streamMessages() {
    try {
      //찾고자 하는 컬렉션의 스냅샷(Stream)을 가져온다.
      final Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance
          .collection('chatting')
          .orderBy("date", descending: true) //date 속성을 내림차순으로 가져온다
          .snapshots();

      //스냅샷(Stream)내부의 자료들을 List<MessageModel> 로 변환하기 위해 map을 사용하도록 한다.
      //참고로 List.map()도 List 안의 element들을 원하는 형태로 변환하여 새로운 List로 반환한다
      return snapshots.map((querySnapshot) {
        print(querySnapshot.docs);
        print("이거 docs");
        List<MessageModel> messages =
            []; //querySnapshot을 message로 옮기기 위해 List<MessageModel> 선언
        querySnapshot.docs.forEach((element) {
          //해당 컬렉션에 존재하는 모든 docs를 순회하며 messages 에 데이터를 추가한다.
          messages.add(MessageModel.fromMap(
              map: element.data() as Map<String, dynamic>));
        });
        print(messages);
        print("이거 메시지");
        return messages; //QuerySnapshot에서 List<MessageModel> 로 변경이 됐으니 반환
      }); //Stream<QuerySnapshot> 에서 Stream<List<MessageModel>>로 변경되어 반환됨
    } catch (ex) {
      //오류 발생 처리
      log('error)', error: ex.toString(), stackTrace: StackTrace.current);
      return Stream.error(ex.toString());
    }
  }
}
