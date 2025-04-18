import 'package:flutter2/model/ride/locations.dart';
import 'package:flutter2/repository/location_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {

  static LocationsService? _instance;
  final LocationRepository repository;

  LocationsService._internal(this.repository);//private constructor

  //Singleton accesor
  static void initialize(LocationRepository repository){
    if(_instance == null){
      _instance = LocationsService._internal(repository);
    }else{
      throw Exception("LocationService is already initialized.");
    }
  }

  //Fetch location
  List<Location> fetchLocations(){
    return repository.getLocation();
  }

   // Add the getter for availableLocations
  static List<Location> get availableLocations {
    return _instance?.fetchLocations() ?? [];
  }

  

 
}