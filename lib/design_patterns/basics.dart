void main() {
  var implementor = DogImplementor();
  var extender = DogExtender();
  var mixer = DogMixer();

  implementor.walk();

  extender.walk();

  mixer.walk();
  print(mixer.age);
}

abstract class Animal {
  int? age = 1;
  String? name = 'Animal';

  void walk() {}
  void absJump();
}

class DogImplementor implements Animal {
  @override
  int? age;

  @override
  String? name;

  @override
  void absJump() {
    // TODO: implement absJump
  }

  @override
  void walk() {
    // TODO: implement walk
  }
}

class DogExtender extends Animal {
  @override
  void absJump() {
    // TODO: implement absJump
  }
}

class DogMixer with Animal {
  @override
  void absJump() {
    // TODO: implement absJump
  }
}
