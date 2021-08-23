import 'package:flutter/material.dart';
import 'package:flutter_feature_flag_1/components/button.dart';
import 'package:flutter_feature_flag_1/components/centered_message.dart';
import 'package:flutter_feature_flag_1/components/progress.dart';
import 'package:flutter_feature_flag_1/screens/contacts/contacts_list.dart';
import 'package:flutter_feature_flag_1/screens/contacts/v2/contacts_list.dart'
    as v2;
import 'package:flutter_feature_flag_1/screens/payments/payments_list.dart';
import 'package:flutter_feature_flag_1/services/webclient.dart';

const _titleAppBar = 'Feature Flag AWS S3';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_titleAppBar),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress(message: 'Loading features...');
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<String>? features = snapshot.data;
                print('features in dashboard: $features');
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          features!.contains('contactsV2')
                              ? Button('Contacts V2', Icons.people_alt_outlined,
                                  onTap: () => _navigateToWidget(
                                      context, v2.ContactsList()))
                              : Button('Contacts', Icons.people,
                                  onTap: () => _navigateToWidget(
                                      context, ContactsList())),
                          Button('Payments', Icons.monetization_on_outlined,
                              onTap: () =>
                                  _navigateToWidget(context, PaymentsList()))
                        ],
                      ),
                    )
                  ],
                );
              }
          }

          return CenteredMessage('Error', icon: Icons.warning);
        },
      ),
    );
  }

  void _navigateToWidget(BuildContext context, Widget routeWidget) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => routeWidget));
  }
}
