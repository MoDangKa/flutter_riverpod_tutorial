import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/main.dart';

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final name = ref.watch(nameProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: Text(name),
//           )
//         ],
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, ref, child) {
//       final name = ref.watch(nameProvider);

//       return Scaffold(
//         appBar: AppBar(
//           title: Text(name),
//         ),
//         body: Column(
//           children: [
//             Center(
//               child: Text(name),
//             )
//           ],
//         ),
//       );
//     });
//   }
// }

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void onSubmit(WidgetRef ref, String value) {
    // ref.read(nameProvider.notifier).update((state) => value);

    // StateNotifierProvider
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final name = ref.watch(nameProvider) != null ? "ref.watch(nameProvider)" : "";
    // final name = ref.watch(nameProvider) ?? ""; // short
    // final nameRead = ref.read(nameProvider);

    // StateNotifierProvider
    final user = ref.watch(userProvider); // as User

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmit(ref, value),
          ),
          TextField(
            onSubmitted: (value) => onSubmitAge(ref, value),
          ),
          Center(
            child: Text(user.age.toString()),
          )
        ],
      ),
    );
  }
}
