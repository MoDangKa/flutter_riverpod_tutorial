import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(builder: (context, ref, child) {
        final name = ref.watch(nameProvider);
        return Column(
          children: [
            Center(
              child: Text(name),
            ),
          ],
        );
      }),
    );
  }
}
