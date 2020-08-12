import 'package:alura_bytebank/screens/contacts_list.dart';
import 'package:flutter/material.dart';

import 'screens/dashboard.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        textTheme: ThemeData.dark().textTheme,
        primaryTextTheme: ThemeData.dark().primaryTextTheme,
        accentTextTheme: ThemeData.dark().accentTextTheme,
        textSelectionHandleColor: ThemeData.dark().textSelectionHandleColor,
        textSelectionColor: Colors.blue[700],
        accentColor: Colors.blueAccent[700],
        scaffoldBackgroundColor: Colors.grey[900],
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.greenAccent[700],
            textTheme: ButtonTextTheme.primary),
      ),
      home: ContactForm(),
    );
  }
}
