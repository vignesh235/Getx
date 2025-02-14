class Animal {
  String name;
  String colour;

  Animal({this.name = "tommy", this.colour = "black"});
  void activity() {
    print('animal activity');
  }
}

class Dog extends Animal {
  @override
  void activity() {
    print("dog is eating");
    super.activity();
  }
}

void main() {
  Animal dog = Dog();
  dog.activity();
}
