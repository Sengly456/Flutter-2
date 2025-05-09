import 'package:flutter/material.dart';
import 'package:flutter2/repository/mock/mock_location_repository.dart';
import 'package:flutter2/repository/mock/mock_ride_preferences_repository.dart';
import 'package:flutter2/repository/mock/mock_ride_repository.dart';
import 'package:flutter2/service/locations_service.dart';
import 'package:flutter2/service/rides_service.dart';
import 'screens/ride_pref/ride_pref_screen.dart';
import 'service/ride_prefs_service.dart';
import 'theme/theme.dart';

void main() {

  // 1 - Initialize the services
  RidePrefService.initialize(MockRidePreferencesRepository());
  LocationsService.initialize(MockLocationRepository()); //initialized LocationService
  RidesService.initialize(MockRideRepository());
  // 2- Run the UI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen()),
    );
  }
}
