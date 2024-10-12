import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/data_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    initialLocation: '/',  // This ensures HomePage is the initial page
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/data',
        builder: (context, state) {
          final dateRange = state.extra as String;
          return DataPage(dateRange: dateRange);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
    debugShowCheckedModeBanner: false,
      routerConfig: _router,  // Use routerConfig for GoRouter setup
      title: 'NASA API App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
