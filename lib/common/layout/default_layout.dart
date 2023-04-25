import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  const DefaultLayout({super.key, required this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16), child: body),
    );
  }
}
