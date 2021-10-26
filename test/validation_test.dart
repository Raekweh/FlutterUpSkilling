import 'package:ParkingApp/Payment/validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Given that the users vehicle plate is NCZ803, When validVehiclePlate is called Then the vehicle plate exist',
      () async {
    final valid = Validation();
    expect(valid.validVehiclePlate('NCZ803'), true);
  });

  test(
      'Given that the users vehicle plate is NC9803, When validVehiclePlate is called Then the vehicle plate does not exist',
      () async {
    final valid = Validation();
    expect(valid.validVehiclePlate('NC9803'), false);
  });

  test(
      'Given that the user enters the area ID as 192836, when the validAreaID is called then the area id doesnt exist',
      () async {
    final valid = Validation();
    expect(valid.validAreaID('192836'), false);
  });
  test(
      'Given that the user enters the area ID as 1928361, when the validAreaID is called then the area id exist',
      () async {
    final valid = Validation();
    expect(valid.validAreaID('1928361'), true);
  });
}
