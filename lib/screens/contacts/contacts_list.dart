import 'package:flutter_feature_flag_1/database/dao/contact_dao.dart';
import 'package:flutter_feature_flag_1/models/contact.dart';
import 'package:flutter_feature_flag_1/screens/contacts/contact_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: FutureBuilder<List<Contact>>(
          initialData: [],
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
                break;
              case ConnectionState.waiting:
                return _Loading();
              case ConnectionState.done:
                final List<Contact>? contacts = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return _ContactItem(contacts![index]);
                  },
                  itemCount: contacts!.length,
                );
            }

            return ListView(children: []);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Loading...',
              style: TextStyle(fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(contact.name, style: TextStyle(fontSize: 24)),
          subtitle: Text(contact.accountNumber.toString(),
              style: TextStyle(fontSize: 16))),
    );
  }
}
