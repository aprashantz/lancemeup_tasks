// making singleton class so that same instance will be provided for constant data
class AppRoutes {
  final String loginScreen = "/login";
  final String homeScreen = "/home";
  final String movieUpdateScreen = "/update";
  final String movieDeleteScreen = "/delete";

  static final AppRoutes _singleton = AppRoutes._internal();

  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal();
}
