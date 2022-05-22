void main() {
  var rubberDuck = RubberDuck();
  rubberDuck.fly();
  rubberDuck.quack();
}

class Duck {
  quack() => print('Quack');
  swim() => print('I am Swimming');
  fly() => print('I am Flying');

  display() {}
}

class MallardDuck extends Duck {
  @override
  display() {
    print('I am a Mallard Duck');
  }
}

class RedHeadDuck extends Duck {
  @override
  display() {
    print('I am a Red Head Duck');
  }
}

class RubberDuck extends Duck {
  @override
  quack() {
    print('Squeak');
  }

  @override
  display() {
    print('I am a Rubber Duck');
  }

  @override
  fly() {}
}

class DecoyDuck extends Duck {
  @override
  quack() {
    print('Mute');
  }

  @override
  display() {
    print('I am a Decoy Duck');
  }

  @override
  fly() {}
}
