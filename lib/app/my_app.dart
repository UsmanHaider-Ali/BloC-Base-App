import 'package:bloc_base_app/app/routes/app_routes.dart';
import 'package:bloc_base_app/app/routes/routes_name.dart';
import 'package:bloc_base_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'BloC Base App',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
        initialRoute: RoutesName.splashRoute,
        onGenerateRoute: AppRoutes.generateRoute,
      );
    });
  }
}
