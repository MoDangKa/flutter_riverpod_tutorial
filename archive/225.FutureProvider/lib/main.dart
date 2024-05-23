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

// final fetchUserProvider = FutureProvider((ref) {
//   const url = 'https://jsonplaceholder.typicode.com/users/1';
//   return http
//       .get(Uri.parse(url))
//       .then((res) => Customer.fromJson(jsonDecode(res.body)));
// });

// final fetchUserProvider =
//     FutureProvider((ref) => CustomerRepository().fetchCustomerData());

final fetchCustomerProvider = FutureProvider((ref) {
  final customerRepository = ref.watch(userRepositoryProvider);
  return customerRepository.fetchCustomerData();
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
