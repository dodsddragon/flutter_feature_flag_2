import 'package:flutter/material.dart';

class PaymentsList extends StatelessWidget {
  const PaymentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payments')),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Nome 1', style: TextStyle(fontSize: 24)),
              subtitle: Text('1001', style: TextStyle(fontSize: 16)),
              trailing: Text('100.0', style: TextStyle(fontSize: 16)),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
