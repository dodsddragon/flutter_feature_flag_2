import 'package:flutter_feature_flag_1/components/editor.dart';
import 'package:flutter_feature_flag_1/database/dao/contact_dao.dart';
import 'package:flutter_feature_flag_1/models/contact.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'New contact V2';
const _labelFieldName = 'Name';
const _hintFieldName = 'First Name';
const _labelFieldSurname = 'Surname';
const _hintFieldSurname = 'Last Name';
const _labelFieldAccountNumber = 'Account Number';
const _hintFieldAccountNumber = '0000000';
const _labelButtonConfirm = 'Confirm';

class ContactForm extends StatelessWidget {
  final TextEditingController _controllerFieldName = TextEditingController();
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();
  final TextEditingController _controllerFieldSurname = TextEditingController();

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Editor(
                  controller: _controllerFieldName,
                  title: _labelFieldName,
                  hint: _hintFieldName,
                  icon: Icon(Icons.emoji_people)),
              Editor(
                  controller: _controllerFieldSurname,
                  title: _labelFieldSurname,
                  hint: _hintFieldSurname,
                  icon: Icon(Icons.people)),
              Editor(
                controller: _controllerFieldAccountNumber,
                title: _labelFieldAccountNumber,
                hint: _hintFieldAccountNumber,
                icon: Icon(Icons.house),
                textInputType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      child: Text(_labelButtonConfirm),
                      onPressed: () {
                        final String name = _controllerFieldName.text;
                        final int? accountNumber =
                            int.tryParse(_controllerFieldAccountNumber.text);
                        final String surname = _controllerFieldSurname.text;

                        final contact = new Contact(name: name, accountNumber: accountNumber!, surname: surname);

                        _dao.save(contact).then((numberOfCreatedRows) {
                          if (numberOfCreatedRows > 0) {
                            Navigator.pop(context);
                          } else {
                            debugPrint('V2 Fail to add the contact: $contact');
                          }
                        });
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
