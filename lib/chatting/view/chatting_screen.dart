import 'package:chatapp/chatting/component/input_widget.dart';
import 'package:chatapp/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InputWidget(
          controller: controller,
        ),
      ],
    ));
  }
}
