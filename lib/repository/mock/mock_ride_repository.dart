import 'package:flutter2/model/ride/locations.dart';
import 'package:flutter2/model/ride/ride.dart';
import 'package:flutter2/model/ride_pref/ride_pref.dart';
import 'package:flutter2/model/user/user.dart';
import 'package:flutter2/repository/ride_repository.dart';
import 'package:flutter2/service/rides_service.dart';

class MockRideRepository implements RidesRepository {
  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    List<Ride> rides = [
      Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        departureDate: DateTime.now()
            .add(Duration(hours: 5, minutes: 30)), // Today at 5:30 AM
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        arrivalDateTime:
            DateTime.now().add(Duration(hours: 7, minutes: 30)), // +2 hours
        driver: User(
          firstName: "Kannika",
          lastName: "Doe",
          email: "kannika@example.com",
          phone: "0123456789",
          profilePicture: "assets/images/kannika.png",
          verifiedProfile: true,
        ),
        availableSeats: 2,
        pricePerSeat: 5.0,
      ),
      Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        departureDate:
            DateTime.now().add(Duration(hours: 20)), // Today at 8:00 PM
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        arrivalDateTime: DateTime.now().add(Duration(hours: 22)), // +2 hours
        driver: User(
          firstName: "Chaylim",
          lastName: "Smith",
          email: "chaylim@example.com",
          phone: "0987654321",
          profilePicture: "assets/images/chaylim.png",
          verifiedProfile: false,
        ),
        availableSeats: 0,
        pricePerSeat: 6.0,
      ),
      Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        departureDate:
            DateTime.now().add(Duration(hours: 5)), // Today at 5:00 AM
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        arrivalDateTime: DateTime.now().add(Duration(hours: 8)), // +3 hours
        driver: User(
          firstName: "Mengtech",
          lastName: "Lee",
          email: "mengtech@example.com",
          phone: "0876543210",
          profilePicture: "assets/images/mengtech.png",
          verifiedProfile: true,
        ),
        availableSeats: 1,
        pricePerSeat: 4.5,
      ),
      Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        departureDate:
            DateTime.now().add(Duration(hours: 20)), // Today at 8:00 PM
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        arrivalDateTime: DateTime.now().add(Duration(hours: 22)), // +2 hours
        driver: User(
          firstName: "Limhao",
          lastName: "Wang",
          email: "limhao@example.com",
          phone: "0654321098",
          profilePicture: "assets/images/limhao.png",
          verifiedProfile: true,
        ),
        availableSeats: 2,
        pricePerSeat: 5.5,
      ),
      Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        departureDate:
            DateTime.now().add(Duration(hours: 5)), // Today at 5:00 AM
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        arrivalDateTime: DateTime.now().add(Duration(hours: 8)), // +3 hours
        driver: User(
          firstName: "Sovanda",
          lastName: "Chan",
          email: "sovanda@example.com",
          phone: "0765432109",
          profilePicture: "assets/images/sovanda.png",
          verifiedProfile: false,
        ),
        availableSeats: 1,
        pricePerSeat: 4.0,
      ),
    ];
    return rides;
  }
}
