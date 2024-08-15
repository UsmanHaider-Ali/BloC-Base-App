import 'package:bloc_base_app/app/routes/routes_name.dart';
import 'package:bloc_base_app/presentation/views/auth/login_screen.dart';
import 'package:bloc_base_app/presentation/views/auth/registration_sreen.dart';
import 'package:bloc_base_app/presentation/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesName.registrationRoute:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}.'),
            ),
          ),
        );
    }
  }
}
