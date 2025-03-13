
import 'package:flutter2/model/ride/locations.dart';
import 'package:flutter2/model/ride_pref/ride_pref.dart';

//oberver
abstract class RidePrefListener {
  void onPreferenceSelected(RidePreference selectedPreference);
}


class RidePrefService{
  RidePreference? _currentPreference; //current state of the subject
  final List<RidePrefListener> _listeners = [];


  // add listener
  void addListener(RidePrefListener listener){
    _listeners.add(listener);
  }

  //remove listener
  void removeListener(RidePrefListener listener){
    _listeners.remove(listener);
  }


  //change the state of the subject and notify the the listener or observer
  void setPreference(RidePreference preference){
    _currentPreference = preference;
    _notifyListeners();
  }
  // notify all the listner through loop
  void _notifyListeners(){
    for(var listener in _listeners){
      listener.onPreferenceSelected(_currentPreference!);
    } 
  }

}


class ConsoleLogger extends RidePrefListener{
  @override
  void onPreferenceSelected(RidePreference selectedPreference){
    print('ride preference changed to : $selectedPreference');
  }
}


void main(){
  ConsoleLogger logger =ConsoleLogger();
  RidePrefService service = RidePrefService();

  service.addListener(logger);
  service.setPreference(RidePreference(departure: Location(name:'siem reab', country:Country.cambodia), departureDate:DateTime.now(), arrival:Location(name:'phnom penh', country: Country.cambodia), requestedSeats: 2));

}