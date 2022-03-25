class StaticClass {
  static late String test;

  static init() {
    test = 'testing static';
  }

  static void printing() {
    print(test);
  }
}
