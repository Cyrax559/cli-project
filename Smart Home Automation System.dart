import "dart:io";

void main(){
  const int minimumTemp = 15;
  const int maxTemp = 30;

  bool lightsOn = false;
  int thermostatTemperature = 20;
  String SecurityStatus = "disarmed";

  print("Welcome to the Smart Home System");
  while(true){
    print("1. Toggle Lights");
    print("2. Set thermostat temperature");
    print("3. Arm/Disarm the system.");
    print("4. View System Status");
    print("5. Exit.");

    stdout.write("Please choose an option.");

    String? userInput = stdin.readLineSync();

    if (userInput == null){
      print("Invalid Option. Please enter a number between 1-5.");
      continue;
    }

    if (userInput == '5'){
      print("Exiting...");
      break;
    } else {

    switch (userInput){
      case '1':
      lightsOn = !lightsOn;
      print("Lights: ${lightsOn ? 'ON' : 'OFF'}.");
      break;

      case '2':
      stdout.write("Enter Temperature: ($minimumTemp to $maxTemp):");

      String? tempInput = stdin.readLineSync();
      int? newTemp = int.tryParse(tempInput ?? "");

      if (newTemp != null){

        if (newTemp >= minimumTemp && newTemp <= maxTemp){
          thermostatTemperature = newTemp;
          print("Temperature Set to $thermostatTemperature");
        } else {
          print("Please Enter a Number between $minimumTemp and $maxTemp");
          break;
        }
      } 
      case '3':
      stdout.write("Enter 'arm' or 'disarm' the security system:");
      String? InputStatus = stdin.readLineSync()?.toLowerCase();

      if (InputStatus == 'arm' || InputStatus == 'disarm') {
        SecurityStatus = InputStatus!;
        print("Security System: $SecurityStatus");
      } else {
        print("Please Enter a valid Input: 'arm' or 'disarm'");
      }
      break;

      case '4':
      print("\nSystem Status:");
      print("Lights: ${lightsOn ? 'ON' : 'OFF'}");
      print("Thermostat: $thermostatTemperature");
      print("Security Status: ${SecurityStatus.toUpperCase()}");

      if (thermostatTemperature % 15 == 0) {
        print("Weather is great ($thermostatTemperature)");
      } else if (thermostatTemperature % 3 == 0) {
        print("Weather is cold ($thermostatTemperature)");
      } else if (thermostatTemperature % 5 == 0) {
        print("Weather is warm ($thermostatTemperature)");
      }
      break;

      default:
      print("Please Enter a Number between 1 and 5");
     } 
    }
  }
}
