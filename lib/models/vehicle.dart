class Vehicle {
  String? id;
  String? name;
  String? type;
  String? status;
  String? image;
  int? battery;
  Location? location;
  double? costPerMinute;

  Vehicle({
    this.id,
    this.name,
    this.type,
    this.status,
    this.image,
    this.battery,
    this.location,
    this.costPerMinute,
  });

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    image = json['image'];
    battery = json['battery'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    costPerMinute = json['cost_per_minute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['status'] = status;
    data['image'] = image;
    data['battery'] = battery;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['cost_per_minute'] = costPerMinute;
    return data;
  }
}

class Location {
  double? lat;
  double? lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
