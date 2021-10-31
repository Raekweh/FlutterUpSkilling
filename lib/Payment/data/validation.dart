class Validation {
  Validation();

  bool validVehiclePlate(String vehicleID) {
    int letters = 0;
    int numbers = 0;
    if (vehicleID.length == 6) {
      for (int i = 0; i < vehicleID.length; i++) {
        if ((i >= 0 && i <= 2) &&
            (vehicleID.codeUnitAt(i) >= 65 && vehicleID.codeUnitAt(i) <= 90)) {
          letters++;
        }
        else if ((vehicleID.codeUnitAt(i) >= 48 && vehicleID.codeUnitAt(i) <= 57) &&
            (i >= 3 && i <= 5)) {
          numbers++;
        }
      }
      return (letters == 3 && numbers ==3);
    }
    return false;
  }

  bool validAreaID(String areaID)
  {
    if(areaID.length == 7)
      {
        return true;
      }
    return false;
  }
}
