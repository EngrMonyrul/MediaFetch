import 'package:flutter/material.dart';
import 'package:mediafetch/core/home/screens/home_screen.dart';
import 'package:mediafetch/utils/routes/routes_manage.dart';
import 'package:mediafetch/utils/theme/base_theme_config.dart';
import 'package:otacore/otacore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitPackages.init(
    baseUrl: "https://api.pexels.com/",
    apiKey: "xsy4y1E3ngPAVZ70tqIfU91PImdpjPntmVnHc6SaMlvY9EWFstm72h1m",
  );
  runApp(
    OtaMain(
      lightTheme: BaseThemeConfig.lightThemeData,
      darkTheme: BaseThemeConfig.darkThemeData,
      title: "Media Fetch",
      home: const HomeScreen(),
      onGenerateRoute: onGenerateRoutes,
    ),
  );
}
