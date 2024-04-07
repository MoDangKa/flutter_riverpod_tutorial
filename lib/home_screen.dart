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

// StateProvider, StateNotifierProvider, ChangeNotifierProvider
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   void onSubmit(WidgetRef ref, String value) {
//     // StateNotifierProvider
//     // ref.read(nameProvider.notifier).update((state) => value);
//     // ref.read(userProvider.notifier).updateName(value);

//     ref.read(userChangeNotifierProvider).updateName(value);
//   }

//   void onSubmitAge(WidgetRef ref, String value) {
//     // userProvider
//     // ref.read(userProvider.notifier).updateAge(int.parse(value));

//     ref.read(userChangeNotifierProvider).updateAge(int.parse(value));
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // StateProvider
//     // final name = ref.watch(nameProvider) ?? ""; // short
//     // final nameRead = ref.read(nameProvider);

//     // StateNotifierProvider
//     // final user = ref.watch(userProvider); // as User
//     // final userName = ref.watch(userProvider).name; // as User
//     // final user = ref.watch(userProvider.select((value) => value.name));

//     // ChangeNotifierProvider
//     final user = ref.watch(userChangeNotifierProvider).user;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(user.name),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             onSubmitted: (value) => onSubmit(ref, value),
//           ),
//           TextField(
//             onSubmitted: (value) => onSubmitAge(ref, value),
//           ),
//           Center(
//             child: Text(user.age.toString()),
//           )
//         ],
//       ),
//     );
//   }
// }

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchUserProvider).when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Center(
                child: Text(data.name),
              )
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            error.toString(),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}


//     return FutureBuilder(future: future, builder: (context, snapshot) {
// if(snapshot.connectionState==ConnectionState.waiting){}
// if(snapshot.hasData){

// }else{

// }
// if(snapshot.hasError){

// }
//       return
//     });