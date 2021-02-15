import 'dart:convert';

import 'package:alura_bytebank/http/webclient.dart';
import 'package:alura_bytebank/models/trasaction.dart';
import 'package:http/http.dart';

class TransactionsWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 15));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }
  /*
  List<Transaction> _toTransactions(Response response) {
    // final List<Transaction> transactions = List();
    // for (Map<String, dynamic> element in decodedJson) {
    //   transactions.add(Transaction.fromJson(element));
    // }
  }
  */
}
