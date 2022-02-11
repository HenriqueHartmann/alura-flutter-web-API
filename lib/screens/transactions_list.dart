import 'package:bytebank/http/webClients/transaction_webclient.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/models/transaction.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList({Key? key}) : super(key: key);

  final List<Transaction> transactions = [];
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: Future.delayed(
            const Duration(seconds: 1)
        ).then((value) => _webClient.findAll()),
        builder: (context, snapshot) {

          switch(snapshot.connectionState) {

            case ConnectionState.none:
            // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
            // TODO: Handle this case.
              return const Progress();
            case ConnectionState.active:
            // TODO: Handle this case.
              break;
            case ConnectionState.done:
            // TODO: Handle this case.
              if(snapshot.hasData) {
                final List<Transaction> transactions = snapshot.data as List<Transaction>;
                if(transactions.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Transaction transaction = transactions[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.monetization_on),
                          title: Text(
                            transaction.value.toString(),
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            transaction.contact.accountNumber.toString(),
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: transactions.length,
                  );
                }
                return const CenteredMessage(
                  'No transactions found',
                  icon: Icons.warning
                );
              }
          }

          return const CenteredMessage(
              'Unknown error',
              icon: Icons.error
          );
        }
      )
    );
  }
}
