import 'package:deeplink/home_page.dart';
import 'package:deeplink/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteServices {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/homepage':
        return CupertinoPageRoute(builder: (_) {
          return const HomeScreen();
        });

      case "/productpage":
        if (args is Map) {
          return CupertinoPageRoute(builder: (_) {
            return ProductPage(
              productId: args["productId"],
            );
          });
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Page Not Found"),
        ),
      );
    });
  }
}
