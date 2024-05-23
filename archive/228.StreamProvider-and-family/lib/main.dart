import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/customer.dart';
import 'screens/home_screen.dart';

// Providers
// Provider
// StateProvider
// StateNotifier and StateNotifierProvider
// ChangeNotifierProvider
// FutureProvider
// StreamProvider

// final fetchCustomerProvider = FutureProvider((ref) {
//   final customerRepository = ref.watch(userRepositoryProvider);
//   return customerRepository.fetchCustomerData("1");
// });

final fetchCustomerProvider = FutureProvider.family((ref, String input) {
  final customerRepository = ref.watch(userRepositoryProvider);
  return customerRepository.fetchCustomerData(input);
});

final streamProvider = StreamProvider((ref) async* {
  // FirebaseFirestore.collection('users').doc(userId).snapshots();
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});

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
