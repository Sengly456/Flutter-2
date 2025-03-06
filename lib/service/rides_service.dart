import 'package:flutter2/model/ride_pref/ride_pref.dart';
import 'package:flutter2/repository/ride_repository.dart';

import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static RidesService? _instance;
  final RidesRepository repository;

  RidesService._internal(this.repository);

  static void initialize(RidesRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    } else {
      throw Exception("Ride service already initialize");
    }
  }

//  singleton accessor
  static RidesService get instance {
    if (_instance == null) {
      throw Exception('Ride service not yet initialize please init in main');
    }
    return _instance!;
  }

  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return repository.getRides(preference, filter);
  }

  static List<Ride> getRidesFor(RidePreference currentPreference) {
    return _instance!.getRides(currentPreference, null);
  }
}

class RidesFilter {
  final bool petAccepted;
  RidesFilter({required this.petAccepted});
}
