void main() {
  var rubberDuck = RubberDuck();
  rubberDuck.fly();
  rubberDuck.quack();
}

class Duck {
  swim() => print('I am Swimming');
  display() {}
}

abstract class FlyBehavior {
  fly();
}

abstract class QuackBehavior {
  quack();
}

class MallardDuck extends Duck implements FlyBehavior, QuackBehavior {
  @override
  display() {
    print('I am a Mallard Duck');
  }

  @override
  fly() => print('I am flying');

  @override
  quack() {
    // TODO: implement quack
    throw UnimplementedError();
  }
}

class RedHeadDuck extends Duck implements FlyBehavior, QuackBehavior {
  @override
  display() {
    print('I am a Red Head Duck');
  }

  @override
  fly() => print('I am flying');

  @override
  quack() {
    // TODO: implement quack
    throw UnimplementedError();
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
