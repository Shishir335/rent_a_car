import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/models/vehicle.dart';
import 'package:rent_a_car/providers/vehicles.dart';
import 'package:rent_a_car/utils/navigator.dart';
import 'package:rent_a_car/utils/theme.dart';
import 'package:rent_a_car/widgets/loader.dart';

class VehicleList extends StatelessWidget {
  const VehicleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VehiclesProvider>(
      builder: (builder, provider, _) {
        return Stack(
          children: [
            // Center(child: const Text('List of Vehicles')),
            RefreshIndicator(
              onRefresh: () => provider.getVehicles(),
              child: ListView(
                children: [
                  for (var vehicle in provider.vehicles)
                    VehicleCard(vehicle: vehicle),
                ],
              ),
            ),
            if (provider.loader) Loader(),
          ],
        );
      },
    );
  }
}

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  const VehicleCard({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Nav.push(context, '/details', arguments: vehicle);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: vehicle.id!.toString(),
                child: Image.network(
                  vehicle.image!,
                  fit: BoxFit.cover,
                  height: 80,
                  width: 120,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(vehicle.name!, style: theme.textTheme.titleMedium),
                  Text(vehicle.type!),
                ],
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(''),
                Text('C/M: ${vehicle.costPerMinute}\$'),
                Text(
                  vehicle.status!,
                  style: TextStyle(
                    color:
                        vehicle.status == 'Available'
                            ? Colors.green
                            : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
