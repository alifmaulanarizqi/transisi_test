enum Flavor {
  production,
  staging,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return 'Flutter Bloc Basic';
      case Flavor.staging:
        return 'Staging Flutter Bloc Basic';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.staging:
        return 'https://reqres.in/api/';
      case Flavor.production:
        return 'https://reqres.in/api/';
      default:
        return 'https://reqres.in/api/';
    }
  }

}
