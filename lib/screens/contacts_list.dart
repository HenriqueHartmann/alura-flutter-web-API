import 'package:bytebank/components/progress.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactsListState();
  }
}

class ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: FutureBuilder<List<Contact>>(
          initialData: const [],
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
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
                final List<Contact> contacts = snapshot.data as List<Contact>;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];

                    return _ContactItem(
                      contact: contact,
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TransactionForm(contact),
                        )).then((value) {
                          setState(() {
                            widget.createState();
                          });
                        });
                      },
                    );
                  },
                  itemCount: contacts.length,
                );
            }
            return const Text('Unknown error,');
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(
                  MaterialPageRoute(builder: (context) => const ContactForm()))
              .then((value) {
            setState(() {
              widget.createState();
            });
          });
        },
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({Key? key, required this.contact, required this.onClick})
      : super(key: key);

  final Contact contact;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
      onTap: () => onClick(),
      title: Text(
        contact.name,
        style: const TextStyle(fontSize: 24.0),
      ),
      subtitle: Text(contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16.0)),
    ));
  }
}
