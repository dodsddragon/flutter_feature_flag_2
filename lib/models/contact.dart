/*
class Contact {
  final String name;
  final int accountNumber;

  Contact(this.name, this.accountNumber);

  @override
  String toString() {
    return 'Contact{name: $name, accountNumber: $accountNumber},';
  }
}
*/

class Contact {
  final String name;
  final int accountNumber;
  final String? surname;

  Contact({required this.name, required this.accountNumber, this.surname});

  @override
  String toString() {
    return 'Contact{name: $name, surname: $surname, accountNumber: $accountNumber},';
  }
}
