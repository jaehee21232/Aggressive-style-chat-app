import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final controller;
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
            onTap: () {},
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
}
