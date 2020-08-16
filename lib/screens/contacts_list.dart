import 'package:alura_bytebank/components/progress.dart';
import 'package:alura_bytebank/database/dao/contact_dao.dart';
import 'package:alura_bytebank/models/contact.dart';
import 'package:alura_bytebank/screens/contact_form.dart';
import 'package:alura_bytebank/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();
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
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;

              case ConnectionState.waiting:
                return Progress();
                break;

              case ConnectionState.active:
                break;

              case ConnectionState.done:
                final List<Contact> listContact = snapshot.data;
                return ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final Contact contact = listContact[index];
                    return _ContactIten(
                      contact,
                      onClick: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TransactionForm(contact),
                        ),
                      ),
                    );
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
  final Function onClick;

  const _ContactIten(this.contact, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      margin: EdgeInsets.all(8),
      child: ListTile(
        onTap: onClick,
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        dense: false,
        title: Text(
          contact.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
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
          color: Colors.greenAccent[700],
        ),
      ),
    );
  }
}
