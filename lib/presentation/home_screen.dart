import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/presentation/profile.dart';
import 'package:rent_a_car/presentation/rent_history.dart';
import 'package:rent_a_car/presentation/vehicle_list.dart';
import 'package:rent_a_car/providers/authentication.dart';
import 'package:rent_a_car/providers/vehicles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    VehicleList(),
    RentHistoryScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    VehiclesProvider provider = Provider.of<VehiclesProvider>(
      context,
      listen: false,
    );

    AuthenticationProvider authProvider = Provider.of<AuthenticationProvider>(
      context,
      listen: false,
    );

    provider.getVehicles();
    Future.delayed(const Duration(milliseconds: 100), () {
      authProvider.login();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Vehicles',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
