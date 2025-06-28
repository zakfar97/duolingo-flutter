import 'package:flutter/material.dart';
import 'package:duolingo/routes/route_names.dart';
import 'package:duolingo/presentation/pages/auth/welcome_screen.dart';
import 'package:duolingo/presentation/pages/auth/login_page.dart';
import 'package:duolingo/presentation/pages/home/home_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.welcome:
        return MaterialPageRoute(
          builder: (_) => WelcomeScreen(),
        );
      
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
