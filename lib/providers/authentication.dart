import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rent_a_car/api_service/api_service.dart';
import 'package:rent_a_car/models/login_response.dart';
import 'package:rent_a_car/utils/end_points.dart';
import 'package:rent_a_car/utils/prefs.dart';

class AuthenticationProvider with ChangeNotifier {
  bool _loader = false;
  bool get loader => _loader;

  changeLoader(bool value) {
    _loader = value;
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }

  String? token;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<HttpHelperResponse> login() async {
    changeLoader(true);
    print(EndPoints.login);
    var res = await HttpHelper.get(
      EndPoints.login,
      // body: {"email": email.text, "password": pass.text},
      needAuth: false,
    );

    changeLoader(false);

    print(checkSuccess(res));

    if (checkSuccess(res)) {
      LoginResponse? loginResponse;
      try {
        loginResponse = LoginResponse.fromJson(res.response[0]);
        token = loginResponse.token!;
        Prefs.setString('token', token!);
      } catch (e) {
        log(e.toString());
      }
      return HttpHelperResponse(res.statusCode, loginResponse);
    } else {
      return HttpHelperResponse(res.statusCode, res.response);
    }
  }
}
