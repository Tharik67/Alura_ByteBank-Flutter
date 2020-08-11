import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
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
                  onTap: () => null,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  dense: false,
                  title: Text(
                    "CAIO",
                    style: TextStyle(fontSize: 24),
                  ),
                  subtitle: Text("conta :10000-2"),
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
