import 'package:flutter/material.dart';

class HanseiPage extends StatefulWidget {
  const HanseiPage({super.key});

  @override
  State<HanseiPage> createState() => _HanseiPageState();
}

class _HanseiPageState extends State<HanseiPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String birday = "0";
    String text = "";
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "태어난 년도를 입력하세요"),
            keyboardType: TextInputType.number,
            controller: controller,
            onChanged: (value) {
              text = value;
            },
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  final today = DateTime.now();
                  birday = (today.year - int.parse(text)).toString();
                  print(birday);
                });
              },
              child: Text("계산하기")),
          Text(
            birday,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      )),
    );
  }
}
