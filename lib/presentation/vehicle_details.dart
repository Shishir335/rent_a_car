import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/models/vehicle.dart';
import 'package:rent_a_car/controllers/vehicles.dart';
import 'package:rent_a_car/utils/navigator.dart';
import 'package:rent_a_car/widgets/buttons.dart';
import 'package:rent_a_car/widgets/loader.dart';
import 'package:rent_a_car/widgets/map_view.dart';

class VehicleDetails extends StatelessWidget {
  const VehicleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Vehicle? data = Nav.getArguments(context);
    return Consumer<VehiclesProvider>(
      builder: (context, provider, _) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(title: Text(data!.name!)),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Hero(
                        tag: data.id.toString(),
                        child: CachedNetworkImage(
                          imageUrl: data.image!,
                          placeholder:
                              (context, url) => Icon(
                                Icons.image_outlined,
                                color: Colors.grey,
                              ),
                          errorWidget:
                              (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  data.name!,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Spacer(),
                                Transform.rotate(
                                  angle: 270 * 3.1415926535 / 180,
                                  child: Icon(Icons.battery_6_bar, size: 30),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '${data.battery!}%',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Type: ',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  data.type!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Text(
                              'Cost per minute: \$${data.costPerMinute}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              data.status == 'Available'
                                  ? 'Available for rent'
                                  : 'Not available for rent',
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge!.copyWith(
                                color:
                                    data.status == 'Available'
                                        ? Colors.green
                                        : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmallMapView(
                      lat: data.location!.lat!,
                      lang: data.location!.lang!,
                    ),
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FullButton(
                name: 'Rent Now',
                onTap: () {
                  provider.rentNow(data);
                },
              ),
            ),
            if (provider.loader) Loader(),
          ],
        );
      },
    );
  }
}
