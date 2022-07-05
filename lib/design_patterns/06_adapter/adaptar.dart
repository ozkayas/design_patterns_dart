abstract class Duck {
  void quack();
  void fly();
}

class MallarDuck implements Duck {
  @override
  void fly() {
    print('Quack');
  }

  @override
  void quack() {
    print("I'm flying");
  }
}

abstract class Turkey {
  void gobble();
  void fly();
}

class WildTurkey implements Turkey {
  @override
  void fly() {
    print("I fly short distances");
  }

  @override
  void gobble() {
    print("gobble gobble");
  }
}

class TurkeyAdapter implements Duck {
  final Turkey _turkey;

  TurkeyAdapter(this._turkey);

  @override
  void fly() {
    _turkey.fly();
  }

  @override
  void quack() {
    _turkey.gobble();
  }
}
