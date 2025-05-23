import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/providers/authentication.dart';
import 'package:rent_a_car/utils/navigator.dart';
import 'package:rent_a_car/utils/prefs.dart';
import 'package:rent_a_car/utils/theme.dart';
import 'package:rent_a_car/widgets/buttons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, provider, _) {
        return Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 4,
                  ),
                ),
                child: Icon(Icons.person_outline, size: 100),
              ),
              SizedBox(height: 20),
              Text(
                provider.loginResponse!.user!.name!,
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(height: 10),
              Text(
                provider.loginResponse!.user!.email!,
                style: theme.textTheme.bodyMedium,
              ),
              Spacer(),
              FullButton(
                name: 'Logout',
                rightChild: Icon(Icons.exit_to_app, color: Colors.white),
                onTap: () async {
                  Prefs.clear();
                  Nav.pushAndRemoveAll(context, '/login');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
