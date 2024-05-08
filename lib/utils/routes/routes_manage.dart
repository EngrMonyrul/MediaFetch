import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediafetch/utils/routes/routes_name.dart';
import '../../core/home/screens/home_screen.dart';

Map<String, WidgetBuilder> routes({Object? args}) {
  return {
    RoutesName.homePage: (context) => const HomeScreen(),
  };
}

Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
  final builder = routes(args: routeSettings.arguments)[routeSettings.name];

  if (builder != null) {
    return MaterialPageRoute(
        settings: routeSettings, builder: (context) => builder(context));
  } else {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Error"),
        ),
      ),
    );
  }
}
