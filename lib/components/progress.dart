import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({this.message = 'Loading', Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          CircularProgressIndicator(),
          Text('Loading')
        ],
      ),
    );
  }
}
