import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/home_screen.dart';
import 'package:flutter_riverpod_tutorial/user.dart';
// import 'package:http/http.dart' as http;

// StateProvider
// final nameProvider = Provider<String>((ref) => "Thanaphon");
// final nameProvider = StateProvider<String?>((ref) => null);

//StateNotifierProvider
// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   (ref) => UserNotifier(
//     const User(name: "", age: 0),
//   ),
// );

// ChangeNotifierProvider
// final userChangeNotifierProvider =
//     ChangeNotifierProvider((ref) => UserNotifierChange());

// FutureProvider
// final fetchUserProvider = FutureProvider((ref) {
//   const url = "https://jsonplaceholder.typicode.com/users/1";
//   return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
// });
final fetchUserProvider = FutureProvider((ref) {
  // return UserRepository().fetchUserData();
  final userRepository = ref.read(userRepositoryProvider);
  return userRepository.fetchUserData();
});

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
      home: const HomeScreen(),
    );
  }
}
