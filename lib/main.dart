import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/home_screen.dart';
import 'package:flutter_riverpod_tutorial/user.dart';

// final nameProvider = Provider<String>((ref) => "Thanaphon");
final nameProvider = StateProvider<String?>((ref) => null);

final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    const User(name: "", age: 0),
  ),
);

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
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
