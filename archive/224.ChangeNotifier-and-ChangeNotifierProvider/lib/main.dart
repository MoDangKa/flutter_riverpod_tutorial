import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/user.dart';
import 'screens/home_screen.dart';

// Providers
// Provider
// StateProvider
// StateNotifier and StateNotifierProvider
// ChangeNotifierProvider

final userChangeNotifierProvider =
    ChangeNotifierProvider((ref) => UserNotifierChange());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod Tutorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
