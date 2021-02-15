import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  const TransactionAuthDialog({@required this.onConfirm});

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Autenticate'),
      titleTextStyle: TextStyle(
        color: Theme.of(context).scaffoldBackgroundColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        maxLength: 4,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style:
            TextStyle(fontSize: 32, letterSpacing: 32, color: Colors.grey[900]),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          fillColor: Colors.grey[900],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancelar',
            style: TextStyle(
                color: Colors.red[900],
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        RaisedButton(
          color: Colors.green[700],
          onPressed: () {
            widget.onConfirm(_passwordController.text);

            Navigator.pop(context);
          },
          child: Text(
            'Confirmar',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    );
  }
}
