import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/weather_screen.dart';
import 'package:weather_app/services/weather_Services.dart';

import 'controller/weather_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var permission = await Permission.location.request();
  if (permission.isDenied) {
    permission = await Permission.location.request();
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => WeatherServicesController(),
    ),
    ChangeNotifierProvider(
      create: (context) => WeatherController(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SafeArea(child: HomeScreen()),
    );
  }
}
