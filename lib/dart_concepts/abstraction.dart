//?abstract method

abstract class Vehicle {
  void start(); // Abstract method (no implementation)
}

class Car extends Vehicle {
  @override
  void start() {
    print("Car is starting...");
  }
}

//?interfaces in dart

abstract class Printer {
  void printDocument();
}

class LaserPrinter implements Printer {
  @override
  void printDocument() {
    print("Printing document using Laser Printer");
  }
}

void main() {
  Printer printer = LaserPrinter();
  printer.printDocument(); // Output: Printing document using Laser Printer
  Car myCar = Car();
  myCar.start(); // Output: Car is starting...
}
