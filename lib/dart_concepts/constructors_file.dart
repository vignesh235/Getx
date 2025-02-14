class Vehicle {
  final String name;
  final int age;
  //   Vehicle() //? a default constructor, calls when object is created
  //   {
  //     print("constructor called");
  //   }

  //?parameterised constructor
  //   Vehicle(String name, int age){
  //     this.name=name;
  //     this.age=age;

  //     print("${this.name} ${this.age}");
  //   }

  //?also this can be written like

  //   Vehicle(this.name, this.age) {
  //     print("${this.name} ${this.age}");
  //   }

  //? parameterized constructor with optional parameter
  //   Vehicle(this.name, [this.age=23]) {
  //     print("${this.name} ${this.age}");
  //   }

  //?constructor with named parameters
  //   Vehicle(this.name, {required this.age}) {
  //     print("${this.name} ${this.age}");
  //   }

  // with default values
  Vehicle(this.name, [this.age = 45]) {
    print("${this.name} ${this.age}");
  }

  //?constant constructor, this is used to save memory
  //?constant constructors cannot have constructor body
  //const Vehicle(this.name, this.age);
}

class Employee {
  String name;
  int age;

  // Named Constructor
  Employee.manager(this.name) : age = 40; // Default age for managers

  Employee.worker(this.name, this.age);

  void display() {
    print("Name: $name, Age: $age");
  }
}

class Circle {
  final double radius;

  // Constant Constructor
  const Circle(this.radius);
}

class Database {
  static Database? _instance;

  // Factory Constructor
  factory Database() {
    if (_instance == null) {
      //? also can be written like this  _instance ??= Database._internal();
      _instance = Database._internal();
    }
    return _instance!;
  }

  Database._internal(); // Private constructor

  void connect() {
    print("Database Connected!");
  }
}

void main() {
  Vehicle v = Vehicle("naveen", 23);
  print(v.name + "${v.age}");
}
