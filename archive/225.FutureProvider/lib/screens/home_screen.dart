import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/models/customer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart';

import '../main.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/my_text_field.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final Logger logger = Logger(printer: PrettyPrinter());
  final _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // logger.d('initState');
    // final user = ref.read(userChangeNotifierProvider);
    // _nameController.text = user.name;
    // _ageController.text = user.age.toString();
    _nameController.addListener(_onNameControllerChanged);
    _ageController.addListener(_onAgeControllerChanged);
  }

  void _onNameControllerChanged() {
    String newName = _nameController.text;
    _onNameChanged(newName);
  }

  void _onAgeControllerChanged() {
    final newAge = _ageController.text;
    _onAgeChanged(newAge);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _onNameChanged(String value) {
    // ref.read(userChangeNotifierProvider).updateName(value);
  }

  void _onAgeChanged(String value) {
    final currentValue =
        value.isNotEmpty ? max(0, int.tryParse(value) ?? 0) : 0;
    // ref.read(userChangeNotifierProvider).updateAge(currentValue);
  }

  Widget _buildBody(Customer customer) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Text("CustomTextField"),
            const SizedBox(height: 15),
            CustomTextField(onChanged: _onNameChanged),
            const SizedBox(height: 15),
            CustomTextField(
              type: TypeOption.number,
              onChanged: _onAgeChanged,
            ),
            const SizedBox(height: 15),
            const CustomDivider(color: Colors.black12),
            const SizedBox(height: 15),
            const Text("MyTextFieldWidget"),
            const SizedBox(height: 15),
            MyTextField(controller: _nameController),
            const SizedBox(height: 15),
            MyTextField(
              type: MyTextFieldTypeOption.currency,
              decimal: 0,
              controller: _ageController,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(fetchCustomerProvider).when(
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
          body: _buildBody(data as Customer),
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
  }
}
