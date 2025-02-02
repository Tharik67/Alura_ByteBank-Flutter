import 'package:flutter/material.dart';

import 'screens/dashboard.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteBank',
      theme: ThemeData(
        cardTheme: ThemeData.dark().cardTheme,
        primaryColor: Colors.green[900],
        textTheme: ThemeData.dark().textTheme,
        primaryTextTheme: ThemeData.dark().primaryTextTheme,
        accentTextTheme: ThemeData.dark().accentTextTheme,
        textSelectionHandleColor: ThemeData.dark().textSelectionHandleColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.green[600], elevation: 10),
        textSelectionColor: Colors.blue[700],
        accentColor: Colors.blueAccent[700],
        scaffoldBackgroundColor: Colors.grey[900],
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.greenAccent[700],
            textTheme: ButtonTextTheme.primary),
        cardColor: Colors.grey[700],
      ),
      home: Dashboard(),
    );
  }
}
