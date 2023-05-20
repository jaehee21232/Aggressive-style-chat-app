import 'package:chatapp/chatting/component/input_widget.dart';
import 'package:chatapp/common/const/data.dart';
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
        body: FutureBuilder(
      future: dataread(),
      builder: <String>(context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InputWidget(
                controller: controller,
                name: snapshot.data[0],
                phonenumber: snapshot.data[1],
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }

  Future dataread() async {
    final name = await storage.read(key: "name");
    final phonenumber = await storage.read(key: "number");
    return [name, phonenumber];
  }
}
