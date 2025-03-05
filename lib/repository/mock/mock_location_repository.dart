import 'package:flutter2/model/ride/locations.dart';
import 'package:flutter2/repository/location_repository.dart';

class MockLocationRepository implements LocationRepository{
  @override
  List<Location> getLocation(){
    return [
      Location(name: "Phnom Penh", country:Country.cambodia),
      Location(name: "Siem Reap", country:Country.cambodia),
      Location(name: "Battambang", country:Country.cambodia),
      Location(name: "Sihanoukville", country:Country.cambodia),
      Location(name: "Kampot", country:Country.cambodia),
    ];
  }
}