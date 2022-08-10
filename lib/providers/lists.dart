import 'package:flutter/material.dart';

class ListData with ChangeNotifier {
  bool showTransport = true;

  void toTransport() {
    showTransport = true;
    notifyListeners();
  }

  void toNonTransport() {
    showTransport = false;
    notifyListeners();
  }

  bool stateSelected = true;

// List<String> VehicleType = [
//   "Non Transport",
//   "Non Transport",
//   "Transport",
// ];
//
// List<String> VehicleClass = [
//   "Motor Car",
//   "Motor Car",
//   "Motor Cycle",
//   "Bus",
//   "Motor Cab",
// ];
//
// List<String> get vehicleType {
//   return [...VehicleType];
// }
//
// List<String> get vehicleClass {
//   return [...VehicleClass];
// }
//
// void setNewVehicleType(String newValue) {
//   VehicleType[0] = newValue;
//   notifyListeners();
// }
//
// void setNewVehicleClass(String newValue) {
//   VehicleClass[0] = newValue;
//   notifyListeners();
// }
//
// String toPrint = "";
// int cost = 0;
//
// void calc(int c) {
//   cost = c;
//   if (VehicleType[0] == "Non Transport" && VehicleClass[0] == "Motor Car") {
//     if (cost > 3500000) {
//       toPrint = (double.parse("14") * cost / 100).toString();
//     } else if (cost > 1500000) {
//       toPrint = (double.parse("13") * cost / 100).toString();
//     } else if (cost > 600000) {
//       toPrint = (double.parse("11") * cost / 100).toString();
//     } else {
//       toPrint = (double.parse("9") * cost / 100).toString();
//     }
//   } else if(VehicleType[0] == "Non Transport" && VehicleClass[0] == "Motor Cycle"){
//     if (cost > 300000) {
//       toPrint = (double.parse("15") * cost / 100).toString();
//     } else if (cost > 150000) {
//       toPrint = (double.parse("12") * cost / 100).toString();
//     } else {
//       toPrint = (double.parse("9") * cost / 100).toString();
//     }
//   }
//   notifyListeners();
// }
}
