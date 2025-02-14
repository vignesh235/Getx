//! factory constructor
//? this is a special type of constructor which returns the instance(cached)
//? it can be like named and default constructor
//? it is used to return single instance
//? using factory constructor singleton pattern is created(which returns same instance everytime)

class Person {
  final String name;

  Person._internal(this.name);

  static final Map<String, Person> _cache = <String, Person>{};

  factory Person(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    } else {
      final person = Person._internal(name);
      _cache[name] = person;
      return person;
    }
  }
  get cache => _cache;
}

class Person1 {
  final String name;

  Person1._internal(this.name);
//try using static
  final Map<String, Person1> _cache = <String, Person1>{};

  Person1(this.name) {
    if (_cache.containsKey(name)) {
      _cache[name]!;
    } else {
      final person = Person1._internal(name);
      _cache[name] = person;
    }
  }

  get cache => _cache;
}

// Singleton using dart factory
class Singleton {
  static final Singleton _instance = Singleton._internal();

  factory Singleton() {
    return _instance;
  }

  Singleton._internal();
}

void main() {
  Singleton obj1 = Singleton();
  Singleton obj2 = Singleton();
  // print(obj1.hashCode);
  // print(obj2.hashCode);
  final person1 = Person('John');
  final person2 = Person('Harry');
  final person3 = Person('John');

  final personA = Person1('John');
  final personB = Person1('Harry');
  final personC = Person1('John');
  print("${personC.cache}");
  print("${personB.cache}");
  print("${personA.cache}");

  print("${person1.cache}");
  print("${person2.cache}");
  print("${person3.cache}");
  // hashcode of person1 and person3 are same
  // print("Person1 name is : ${person1.name} with hashcode ${person1.hashCode}");
  // print("Person2 name is : ${person2.name} with hashcode ${person2.hashCode}");
  // print("Person3 name is : ${person3.name} with hashcode ${person3.hashCode}");

  //? hashcode of all the objects are different, because it doesnt return the same instance
  // print("personA name is : ${personA.name} with hashcode ${personA.hashCode}");
  // print("personB name is : ${personB.name} with hashcode ${personB.hashCode}");
  // print("personC name is : ${personC.name} with hashcode ${personC.hashCode}");
}
