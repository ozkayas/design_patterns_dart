enum Singleton {
  _instance;
  
//   const Singleton(){
//     print('creating...');
//   }
  
  static Singleton getInstance() => _instance;
  
  final String name = "A Singleton";
//   final String creationDate = DateTime.now().toIso8601String();
}

void main() {
    var singleton = Singleton.getInstance();
  
  print(singleton.name);
  
  var singleton2 = Singleton.getInstance();
  
  print(singleton == singleton2);
}