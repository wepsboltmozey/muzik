import 'package:flutter/material.dart';

class PlayListOnline extends StatefulWidget {
  const PlayListOnline({super.key});

  @override
  State<PlayListOnline> createState() => _PlayListOnlineState();
}

class _PlayListOnlineState extends State<PlayListOnline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("PLAY LIST"),
      ),
    );
  }
}
