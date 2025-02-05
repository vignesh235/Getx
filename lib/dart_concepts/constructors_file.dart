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

void main() {
  Vehicle v = Vehicle("naveen", 23);
  print(v.name + "${v.age}");
}
