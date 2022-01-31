import 'package:bytebank/http/web_client.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/screens/dashboard.dart';

//import 'models/contact.dart';
//import 'models/transaction.dart';

void main() {
  runApp(const BytebankApp());
  //save(Transaction(200.0, Contact(0, 'Gui', 2000))).then((transaction) => print(transaction));
  findAll().then((transactions) => print('new transactions $transactions'));
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green.shade900,
          colorScheme:
            ColorScheme.fromSwatch().copyWith(
              primary: Colors.green.shade900,
              secondary: Colors.blueAccent.shade700,
            ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blueAccent.shade700),
            ),
          ),
        ),
        home: const Dashboard(),
    );
  }
}
