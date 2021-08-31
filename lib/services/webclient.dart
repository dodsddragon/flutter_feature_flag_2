import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final String url = 'https://flutter-feature-flag-2.s3.us-east-2.amazonaws.com/flutter-feature-flag-2.json';
//final String url = 'https://pocfeaturetoggleapi20210727235612.azurewebsites.net/FeatureToggle';

Future<List<String>> findAll() async {
  final Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  final Response response = await client
      .get(Uri.parse(url))
      .timeout(Duration(seconds: 5));
  final List<String> features = [];

  var featuresJson = jsonDecode(response.body)['features'];
  return featuresJson != null ? List.from(featuresJson) : [];
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data.toString());
    return data;
  }
}
