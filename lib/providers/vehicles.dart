import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:rent_a_car/models/vehicle.dart';
import 'package:rent_a_car/utils/end_points.dart';
import 'package:rent_a_car/api_service/api_service.dart';

class VehiclesProvider with ChangeNotifier {
  bool _loader = false;
  bool get loader => _loader;

  changeLoader(bool value) {
    _loader = value;
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }

  final List<Vehicle> _vehicles = [];
  List<Vehicle> get vehicles => _vehicles;

  getVehicles() async {
    _loader = true;
    var res = await HttpHelper.get(EndPoints.vehicles, needAuth: false);

    changeLoader(false);

    try {
      _vehicles.clear();
      for (var item in res.response) {
        _vehicles.add(Vehicle.fromJson(item));
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
