import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/models/logger_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'models/customer.dart';
import 'screens/home_screen.dart';
part 'main.g.dart';

// Providers
// Provider
// StateProvider
// StateNotifier and StateNotifierProvider
// ChangeNotifierProvider
// FutureProvider
// StreamProvider

// WidgetRef
// ProviderRef
// Ref

// ProviderObserver

@riverpod // dart run build_runner watch
Future<Customer> fetchCustomer(FetchCustomerRef ref,
    {required String input,
    required int someValue,
    required bool secondValue}) {
  final customerRepository = ref.watch(customerRepositoryProvider);
  return customerRepository.fetchCustomerData(input);
}

// final fetchCustomerProvider =
//     FutureProvider.family.autoDispose((ref, String input) {
//   final customerRepository = ref.watch(customerRepositoryProvider);
//   return customerRepository.fetchCustomerData(input);
// });

final streamProvider = StreamProvider.autoDispose((ref) async* {
  // FirebaseFirestore.collection('users').doc(userId).snapshots();
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});

void main() {
  runApp(
    ProviderScope(
      observers: [LoggerRiverpod()],
      child: MyApp(),
    ),
  );
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
