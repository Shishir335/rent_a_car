import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rent_a_car/utils/theme.dart';
import 'package:rent_a_car/widgets/common.dart';

class SmallMapView extends StatelessWidget {
  final double lat;
  final double lang;

  const SmallMapView({super.key, required this.lat, required this.lang});

  @override
  Widget build(BuildContext context) {
    final point = LatLng(lat, lang);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Location', style: theme.textTheme.titleLarge),
              InkWell(
                onTap: () {
                  openMap(point.latitude, point.longitude);
                },
                child: Row(
                  children: [
                    Text(
                      'To Map',
                      style: theme.textTheme.labelMedium!.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: theme.primaryColor,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: theme.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FlutterMap(
                options: MapOptions(initialCenter: point, initialZoom: 13.0),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: point,
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.location_pin,
                          size: 40,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
