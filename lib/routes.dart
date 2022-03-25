import 'package:bloc/bloc.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:mycart/presentation/screens/authenticate/login_screen.dart';
import 'package:mycart/presentation/screens/home_screen/home_screen.dart';
import 'package:mycart/presentation/screens/bottom_screens/products_screen.dart';
import 'package:mycart/presentation/screens/authenticate/register.dart';
import 'package:mycart/presentation/screens/search_screen.dart';
import 'package:mycart/presentation/screens/splash/welcome_screen.dart';
import 'data/data_model/user.dart';
import 'presentation/screens/splash/splash_screen.dart';

class Screens {
  static const splashScreen = '/';
  static const loginScreen = '/Login';
  static const homeScreen = '/Home';
  static const registerScreen = '/register';
  static const WelcomeScreen = '/WelcomeScreen';
  static const productsScreen = '/productsScreen';
  static const searchScreen = '/searchScreen';
}

class MyAppRoutes {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Screens.loginScreen:
        return PageRouteBuilder(
          pageBuilder: (_, a1, a2) => LoginScreen(),
          transitionsBuilder: (context, a1, a2, child) => FadeTransition(
            opacity: a1,
            child: child,
          ),
        );
      case Screens.WelcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Screens.productsScreen:
        return MaterialPageRoute(builder: (_) => ProductsScreen());
      case Screens.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Screens.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Screens.searchScreen:
        return MaterialPageRoute(builder: (_) => SearchScreen());
    }
  }
}
