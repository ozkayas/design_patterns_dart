void main() {
  /// LIST ITERATION
  List<int> testList = [10, 20, 30, 40, 50];

  Iterator itTestList = testList.iterator;

  while (itTestList.moveNext()) {
    print(itTestList.current);
  }

  /// MAP ITERATION
  Map<String, dynamic> map = {
    'key1': 'value1',
    'key2': 'value2',
    'key3': 'value3',
    'key4': 'value4',
  };

  print(map.runtimeType);

  Iterator mapKeysIterator = map.keys.iterator;
  Iterator mapValuesIterator = map.values.iterator;
  while (mapKeysIterator.moveNext() && mapValuesIterator.moveNext()) {
    print('${mapKeysIterator.current} : ${mapValuesIterator.current}');
  }
}
