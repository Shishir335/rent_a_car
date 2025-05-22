import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rent_a_car/utils/prefs.dart';
import 'package:rent_a_car/widgets/common.dart';

class HttpHelper {
  static Future<HttpHelperResponse> get(
    String endPoint, {
    bool needAuth = true,
    String? tempToken,
  }) async {
    log(endPoint);
    try {
      String? token = await Prefs.getString('token');
      log('$token');

      http.Response res = await http.get(
        Uri.parse(endPoint),
        headers:
            needAuth ? {'Authorization': 'Bearer ${tempToken ?? token}'} : null,
      );

      log(res.body);
      log(res.statusCode.toString());
      return HttpHelperResponse(res.statusCode, jsonDecode(res.body));
    } catch (e) {
      log("error: $e");
      return HttpHelperResponse(400, null);
    }
  }

  static Future<HttpHelperResponse> post(
    String endPoint, {
    dynamic body,
    bool needAuth = true,
    String? tempToken,
  }) async {
    String? token = await Prefs.getString('token');
    print(token);
    print(endPoint);
    print(body.toString());
    try {
      var res = await http.post(
        Uri.parse(endPoint),
        body: body,
        headers:
            needAuth ? {'Authorization': 'Bearer ${tempToken ?? token}'} : null,
      );
      debugPrint(res.statusCode.toString());
      debugPrint(res.body);
      return HttpHelperResponse(res.statusCode, jsonDecode(res.body));
    } catch (e) {
      print("error: $e");
      return HttpHelperResponse(400, null);
    }
  }

  static put() async {}
  static patch() async {}
  static delete() async {}
}

checkSuccess(HttpHelperResponse res) {
  print(res.response);
  if (res.statusCode! >= 200 && res.statusCode! < 300) {
    return true;
  } else {
    snackbar(message: 'Something went wrong', statusCode: res.statusCode);
    return false;
  }
}

class HttpHelperResponse {
  int? statusCode;
  dynamic response;

  HttpHelperResponse(this.statusCode, this.response);
}
