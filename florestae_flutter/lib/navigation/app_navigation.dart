import 'package:florestae_flutter/model/monitored_area.dart';
import 'package:florestae_flutter/navigation/app_routes.dart';
import 'package:florestae_flutter/ui/screens/about_screen.dart';
import 'package:florestae_flutter/ui/screens/area_detail_screen.dart';
import 'package:florestae_flutter/ui/screens/emissions_screen.dart';
import 'package:florestae_flutter/ui/screens/home_screen.dart';
import 'package:florestae_flutter/ui/screens/intro_screen.dart';
import 'package:florestae_flutter/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(
            onFinish: () {
              Navigator.pushReplacementNamed(context, AppRoutes.intro);
            },
          ),
        );

      case AppRoutes.intro:
        return MaterialPageRoute(
          builder: (context) => IntroScreen(
            onFinish: () {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            },
          ),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            onAreaClick: (area) {
              Navigator.pushNamed(context, AppRoutes.areaDetail, arguments: area);
            },
            onEmissionsClick: () {
              Navigator.pushNamed(context, AppRoutes.emissions);
            },
            onAboutClick: () {
              Navigator.pushNamed(context, AppRoutes.about);
            },
          ),
        );

      case AppRoutes.areaDetail:
        final area = settings.arguments as MonitoredArea?;
        return MaterialPageRoute(
          builder: (context) => AreaDetailScreen(
            area: area,
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      case AppRoutes.emissions:
        return MaterialPageRoute(
          builder: (context) => EmissionsScreen(
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      case AppRoutes.about:
        return MaterialPageRoute(
          builder: (context) => AboutScreen(
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Rota não encontrada'))),
        );
    }
  }
}
