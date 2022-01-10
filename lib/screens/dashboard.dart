import 'package:flutter/material.dart';
import 'package:bytebank/screens/contacts_list.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                // horizontal spacing between the items
                crossAxisSpacing: 4,
                // vertical spacing between the items
                mainAxisSpacing: 2,
                // number of items per row
                crossAxisCount: 3,
                children: const <Widget>[
                  _FeatureItem(icon: Icons.people, name: 'Contacts'),
                  _FeatureItem(icon: Icons.monetization_on, name: 'Transfer'),
                  _FeatureItem(icon: Icons.description, name: 'Transaction Feed'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({Key? key, required this.icon, required this.name}) : super(key: key);

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).primaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const ContactsList()
                )
            );
          },
          child: Container(
              padding: const EdgeInsets.all(8.0),
              width: 150,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(icon, color: Colors.white, size: 24.0,),
                  Text(name, style: const TextStyle(color: Colors.white,
                      fontSize: 16.0),)
                ],
              )
          ),
        ),
    );
  }
}
