import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import '../main.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String customerNo = "1";

  @override
  Widget build(BuildContext context) {
    return ref.watch(fetchCustomerProvider(customerNo)).when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              data.name ?? "",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: HexColor("#2196F3"),
          ),
          body: Column(
            children: [
              Center(
                child: TextField(
                  onSubmitted: (value) => setState(() {
                    customerNo = value;
                  }),
                ),
              )
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(error.toString()),
          ),
        );
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );

    // return ref.watch(streamProvider).when(
    //   data: (data) {
    //     return Scaffold(
    //       body: Text(data.toString()),
    //     );
    //   },
    //   error: (error, stackTrace) {
    //     return Scaffold(
    //       body: Center(
    //         child: Text(error.toString()),
    //       ),
    //     );
    //   },
    //   loading: () {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
  }
}
