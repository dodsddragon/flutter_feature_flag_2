import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final String? hint;
  final Icon? icon;
  final TextInputType? textInputType;

  Editor({this.controller, this.title, this.hint, this.icon, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24),
        decoration:
        InputDecoration(icon: icon, labelText: title, hintText: hint),
        keyboardType: textInputType,
      ),
    );
  }
}
