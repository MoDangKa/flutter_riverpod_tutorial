import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import 'main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void onChangeName(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onChangeAge(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: HexColor("#2196F3"),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onChangeName(ref, value),
          ),
          TextField(
            onSubmitted: (value) => onChangeAge(ref, value),
          ),
          Center(
            child: Text(user.age.toString()),
          ),
        ],
      ),
    );
  }
}
