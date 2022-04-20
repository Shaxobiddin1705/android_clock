import 'dart:developer';

import 'package:http/http.dart';

class Network{

  static String baseApi = "my2.dev.gov.uz";

  static Map<String, String> headers = {'Content-type': 'application/json'};


  /* Http Requests */

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.http(baseApi, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) return response.body;
    return null;
  }

  /* Http Apis */
  static String API_GET = "/azamat/ru/weather/get-details";

  /* Http Params */
  static Map<String, String> paramsGet({required region}) {
    Map<String, String> params = {};
    params.addAll({
      'region' : region
    });
    return params;
  }

}