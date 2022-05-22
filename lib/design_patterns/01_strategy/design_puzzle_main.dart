import 'package:deletelater/design_patterns/01_strategy/design_puzzle.dart';

void main() {
  Character king = King(weaponBehavior: SwordBehavior());
  king.fight();

  king.setWeapon = KnifeBehavior();
  king.fight();

  Character troll = Troll(weaponBehavior: AxeBehavior());
  troll.fight();

  Character knight = Knight();
  knight.fight();
  knight.setWeapon = AxeBehavior();
  knight.fight();
}
