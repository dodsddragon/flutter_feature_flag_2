import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String _name;
  final IconData _icon;
  final Function onTap;

  Button(this._name, this._icon, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
            padding: EdgeInsets.all(8.0),
            height: 80,
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(_icon, color: Colors.white, size: 24.0),
                Text(_name,
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
              ],
            )),
      ),
    );
  }
}
