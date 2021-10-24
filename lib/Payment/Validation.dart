class Validation {
  Validation();

  bool validVehiclePlate(String vehicleID) {
    int firstHalf = 0;
    int secondHalf = 0;
    if (vehicleID.length == 6) {
      for (int i = 0; i < vehicleID.length; i++) {
        if ((i >= 0 && i <= 2) &&
            (vehicleID.codeUnitAt(i) >= 65 && vehicleID.codeUnitAt(i) <= 90)) {
          firstHalf++;
        }
        else if ((vehicleID.codeUnitAt(i) >= 48 && vehicleID.codeUnitAt(i) <= 57) &&
            (i >= 3 && i <= 5)) {
          secondHalf++;
        }
      }
      return (secondHalf == 3 && firstHalf ==3);
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
