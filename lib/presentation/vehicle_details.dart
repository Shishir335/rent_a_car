import 'package:flutter/material.dart';
import 'package:rent_a_car/models/vehicle.dart';
import 'package:rent_a_car/utils/navigator.dart';
import 'package:rent_a_car/widgets/buttons.dart';

class VehicleDetails extends StatelessWidget {
  const VehicleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Vehicle? data = Nav.getArguments(context);
    return Scaffold(
      appBar: AppBar(title: Text(data!.name!)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Hero(
              tag: data.id.toString(),
              child: Image.network(data.image!, fit: BoxFit.cover),
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.name!, style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: 10),
                Text(
                  'Cost per minute: \$${data.costPerMinute}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FullButton(name: 'Rent', onTap: () {}),
    );
  }
}
