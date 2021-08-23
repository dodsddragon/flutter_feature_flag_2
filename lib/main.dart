import 'package:flutter/material.dart';
import 'package:flutter_feature_flag_1/screens/login_fake.dart';

void main(){
  runApp(FlutterFeatureFlagApp());
}

class FlutterFeatureFlagApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: LoginFakeForm());
  }
}