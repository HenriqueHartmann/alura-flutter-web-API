import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data);
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  const String endpoint = 'http://172.16.83.104:8080';
  const String api = '/transactions';

  final Client client = InterceptedClient.build(
      interceptors: [LoggingInterceptor()],
      requestTimeout: const Duration(seconds: 5)
  );

  final Response response = await client.get(
      Uri.parse(endpoint + api)).timeout(const Duration(seconds: 5)
  );

  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];

  for(Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(
      transactionJson['value'],
        Contact(
            0,
            contactJson['name'],
            contactJson['accountNumber']
        ),
    );
    transactions.add(transaction);
  }

  return transactions;
}