import 'package:flutter/material.dart';
import 'package:top_flutter_repositories/core/router/on_generate_route.dart';


void main() async{
  final RouteGenerator routeGenerator = RouteGenerator();
  runApp( MyApp(routeGenerator: routeGenerator,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,    required this.routeGenerator,});
  final RouteGenerator routeGenerator;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
   onGenerateRoute:RouteGenerator().onGenerateRoute,
    );
  }
}

