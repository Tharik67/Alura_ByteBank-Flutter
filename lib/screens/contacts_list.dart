import 'package:alura_bytebank/database/app_database.dart';
import 'package:alura_bytebank/models/contact.dart';
import 'package:alura_bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ContactForm();
              },
            ),
          ).then((value) {
            setState(() {});
          });
        },
        // ignore: todo
        // TODO Para atualizar a pagina quando voltar, adicionar o then((value) {setState(() {});}); no navigator

        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: List(),
          future: findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;

              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Loading...'),
                      ),
                    ],
                  ),
                );

              case ConnectionState.active:
                break;

              case ConnectionState.done:
                final List<Contact> listContact = snapshot.data;
                return ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final Contact contact = listContact[index];
                    return _ContactIten(contact);
                  },
                  itemCount: listContact.length,
                );
                break;
            }
            return Text("Unknown Error. Notifique o dev");
          }),
    );
  }
}

class _ContactIten extends StatelessWidget {
  final Contact contact;

  const _ContactIten(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        dense: false,
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        leading: Icon(
          Icons.person,
          size: 48,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
