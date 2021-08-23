import 'package:flutter_feature_flag_1/components/editor.dart';
import 'package:flutter_feature_flag_1/database/dao/contact_dao.dart';
import 'package:flutter_feature_flag_1/models/contact.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'New contact';
const _rotuloCampoNome = 'Name';
const _dicaCampoNome = 'XXXX';
const _rotuloCampoNumeroConta = 'Account';
const _dicaCampoNumeroConta = '0000';
const _tituloBotaoConfirmar = 'Confirm';

class ContactForm extends StatelessWidget {
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Editor(
                  controller: _controladorCampoNome,
                  title: _rotuloCampoNome,
                  hint: _dicaCampoNome,
                  icon: Icon(Icons.people)),
              Editor(
                controller: _controladorCampoNumeroConta,
                title: _rotuloCampoNumeroConta,
                hint: _dicaCampoNumeroConta,
                icon: Icon(Icons.house),
                textInputType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      child: Text(_tituloBotaoConfirmar),
                      onPressed: () {
                        final String name = _controladorCampoNome.text;
                        final int? accountNumber =
                            int.tryParse(_controladorCampoNumeroConta.text);

                        final contact = new Contact(name: name, accountNumber: accountNumber!);

                        _dao.save(contact).then((numberOfCreatedRows) {
                          if (numberOfCreatedRows > 0) {
                            Navigator.pop(context);
                          } else {
                            debugPrint('Fail to add the contact: $contact');
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
