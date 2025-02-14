//! method overriding

class Animal {
  void makeSound() {
    print("Animal makes a sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Dog barks");
  }
}
//! method overloading

class Calculator {
  void add(int a, [int? b]) {
    if (b != null) {
      print("Sum: \${a + b}");
    } else {
      print("Value: \$a");
    }
  }
}

void main() {
  Animal myAnimal = Dog();
  myAnimal.makeSound(); // Output: Dog barks

  Calculator calc = Calculator();
  calc.add(5); // Output: Value: 5
  calc.add(5, 10); // Output: Sum: 15
}
