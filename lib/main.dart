import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: Text("ByteBank"),
        ),
        body: Column(
          children: [Image.asset('images/bytebank_logo.png')],
        ),
      ),
    );
  }
}
