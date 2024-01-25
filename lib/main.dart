import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_flutter_repositories/core/router/on_generate_route.dart';
import 'package:top_flutter_repositories/core/router/theme/app_theme.dart';

void main() async {
  final RouteGenerator routeGenerator = RouteGenerator();
  runApp(MyApp(
    routeGenerator: routeGenerator,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.routeGenerator,
  });
  final RouteGenerator routeGenerator;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialAppWidget(routeGenerator: routeGenerator);
      },
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    Key? key,
    required this.routeGenerator,
  }) : super(key: key);

  final RouteGenerator routeGenerator;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme(textTheme),
      darkTheme: AppTheme.darkTheme(textTheme),
      onGenerateRoute: RouteGenerator().onGenerateRoute,
    );
  }
}
