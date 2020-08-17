import 'package:alura_bytebank/components/centered_message.dart';
import 'package:alura_bytebank/components/progress.dart';
import 'package:alura_bytebank/http/webclients/transactions_webclient.dart';
import 'package:alura_bytebank/models/trasaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TransactionsList extends StatelessWidget {
  final TransactionsWebClient _webClient = TransactionsWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
          future: _webClient.findAll(),
          //Future.delayed(Duration(seconds: 0)).then((value) => findAll()),
          //usado para testar o progress
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<dynamic> transactions = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:

                  // ignore: todo
                  // TODO: Handle this case.
                  break;
                case ConnectionState.waiting:
                  return Progress(
                    message: 'extratos',
                  );
                  break;

                case ConnectionState.active:
                  // ignore: todo
                  // TODO: Handle this case.
                  break;
                case ConnectionState.done:
                  if (transactions.isNotEmpty) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final Transaction transaction = transactions[index];
                        return Card(
                          color: Colors.grey[300],
                          margin:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                            leading: Icon(
                              Icons.monetization_on,
                              size: 48,
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text(
                              transaction.value.toString(),
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                            subtitle: Text(
                              '${transaction.contact.name} - ${transaction.contact.accountNumber}',
                              style: TextStyle(
                                fontSize: 16.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: transactions.length,
                    );
                  }
              }
              return CenteredMessage(
                'Voce ainda nao efetuou uma transacao',
                icon: Icons.warning,
              );
            }
            return CenteredMessage("Unknown Error. Notifique o dev");
          }),
    );
  }
}
