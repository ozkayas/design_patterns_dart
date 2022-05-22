/// Puzzle at page 25
///

abstract class Character {
  IWeaponBehavior _weaponBehavior;
  Character({required IWeaponBehavior weaponBehavior})
      : _weaponBehavior = weaponBehavior;

  set setWeapon(newBehavior) => _weaponBehavior = newBehavior;

  void fight() => _weaponBehavior.useWeapon();
}

abstract class IWeaponBehavior {
  void useWeapon();
}

/// Concrete Weapon implementation classes
class SwordBehavior implements IWeaponBehavior {
  @override
  void useWeapon() => print("Swinging a sword");
}

class KnifeBehavior implements IWeaponBehavior {
  @override
  void useWeapon() => print("Cutting with a knife");
}

class AxeBehavior implements IWeaponBehavior {
  @override
  void useWeapon() => print("Chopping wiht an axe");
}

/// Character classes extends from Character

class King extends Character {
  King({required IWeaponBehavior weaponBehavior})
      : super(weaponBehavior: weaponBehavior);
}

class Queen extends Character {
  Queen({required IWeaponBehavior weaponBehavior})
      : super(weaponBehavior: weaponBehavior);
}

class Knight extends Character {
  Knight({IWeaponBehavior? weaponBehavior})
      : super(weaponBehavior: weaponBehavior ?? SwordBehavior());
}

class Troll extends Character {
  Troll({required IWeaponBehavior weaponBehavior})
      : super(weaponBehavior: weaponBehavior);
}
