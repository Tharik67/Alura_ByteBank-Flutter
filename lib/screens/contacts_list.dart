import 'package:alura_bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ContactForm())),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Card(
                margin: EdgeInsets.all(16),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  dense: false,
                  title: Text(
                    "CAIO",
                    style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                  subtitle: Text(
                    "conta :10000-2",
                    style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                  leading: Icon(
                    Icons.person,
                    size: 48,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
