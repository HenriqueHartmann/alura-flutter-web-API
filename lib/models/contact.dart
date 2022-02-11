class Contact {
  Contact(this.id, this.name, this.accountNumber);

  final int id;
  final String name;
  final int? accountNumber;

  Contact.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      name = json['name'],
      accountNumber = json['accountNumber'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'accountNumber': accountNumber
  }

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accountNumber: $accountNumber}';
  }
}