import 'dart:convert';

import 'package:alura_bytebank/models/contact.dart';
import 'package:alura_bytebank/models/trasaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('url: ${data.toHttpRequest()}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('StatusCode: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');

    return data;
  }
}

Future<List<Transaction>> findAll() async {
  final Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
  );
  final Response response =
      await client.get('http://192.168.1.102:8080/transactions');
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = List();
  for (Map<String, dynamic> element in decodedJson) {
    final Map<String, dynamic> contactJson = element['contact'];
    final Transaction transaction = Transaction(
        element['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ));
    transactions.add(transaction);
  }
  return transactions;
}
