import 'package:flutter/material.dart';
import 'package:flutter_feature_flag_1/components/editor.dart';
import 'package:flutter_feature_flag_1/screens/dashboard.dart';

const _buttonTitle = 'Login';
const _labelFieldPassword = 'Password';
const _labelFieldUser = 'Username';
const _titleAppBar = 'Login Fake';

class LoginFakeForm extends StatelessWidget {
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
                  title: _labelFieldUser,
                  icon: Icon(Icons.people)),
              Editor(
                title: _labelFieldPassword,
                icon: Icon(Icons.house),
                textInputType: TextInputType.visiblePassword,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      child: Text(_buttonTitle),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => Dashboard()));
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
