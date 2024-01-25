
import 'package:flutter/material.dart';
import 'package:top_flutter_repositories/core/router/route_name.dart';
import 'package:top_flutter_repositories/features/homepage/presentation/pages/home_page.dart';



class RouteGenerator {
  static final RouteGenerator _instance = RouteGenerator._internal();

  factory RouteGenerator() {
    return _instance;
  }

  RouteGenerator._internal();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.root:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
          settings: settings,
        );
 
      // case RouteName.repositoriesDetails:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => const DashboardScreen(),
      //     settings: settings,
      //   );
    
      default:
        return _errorRoute(); // Return null for unknown routes
    }

  
  }
}

// Method to handle error case
Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (BuildContext context) => const ErrorScreen(),
    // You can replace ErrorScreen with your custom error screen
  );
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text(''),
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const Text(
              'An error occurred',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Sorry, an error occurred while navigating.',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}