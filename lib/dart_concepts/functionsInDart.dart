//?syntax

/*
  returntype functionname(parmas)
  {
  code block
  }
*/

//?void function
void functionName() {
  print("something");
}

//positional parameters
functionname(
  int a,
  bool b,
) {}

//optional positional parameters
String returnsTring(String name, [String lastName = "Selvam"]) {
  return name + lastName;
}

//named parameters
String namedParameter({required String name, String lastName = "Selvam"}) {
  return name + lastName;
}

//either positional and named or positonal and optional parameters can be used,both cannot be used
String namedAndOptional(String? name, {String lastname = "selvam"}) {
  return "";
}

//?anonymous functions
var inta = (int a) {
  return a + 1;
};

void main() {
  functionname(1, false);
  functionName();
  returnsTring("Naveen", "selvam");
  namedParameter(name: "naveen", lastName: "");
  namedAndOptional(null);

  print(inta(5));

  List<int> numbers = [1, 2, 3, 4];
  numbers.forEach(
    (element) {
      print(element + 1);
    },
  );
  print(numbers.map(
    (e) {
      return e * e;
    },
  ).toList());
}
