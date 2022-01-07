class Contact {
  Contact(this.id, this.name, this.accountNumber);

  final int id;
  final String name;
  final int? accountNumber;

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accountNumber: $accountNumber}';
  }
}