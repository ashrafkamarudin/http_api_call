import 'package:flutter_test/flutter_test.dart';
import 'package:http_api_call/response/ApiResponse.dart';
import 'package:http_api_call/http_api_call.dart';
import 'dart:convert';

void main() {
  test('Test Auth', () async {

    ApiResponse response = await Api(
      apiKey: 'k6pWb106e34MN8jjLyPWO5rYrtMRzWbw9UYL9FtKJwAF',
      secretKey: 'J694AAqcMADTPaVH427zpI2DwYg6zZwH32ewcTAloZQRK7l1gxG6DkNh3TGlo10C')
    .get("https://manage.runcloud.io/api/v2/ping")
    .then((response) {
      return ApiResponse.fromJson(json.decode(response.body));
    });
    print(response.message);
    // expect(rc.auth, 'test');
  });
}
