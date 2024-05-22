import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/widgets/custom_divider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../main.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/my_text_field_widget.dart';
import '../widgets/my_text_field.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onNameChanged);
    _ageController.addListener(_onAgeChanged);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void onChangeName(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onChangeAge(WidgetRef ref, String value) {
    try {
      double doubleValue = double.tryParse(value) ?? 0;
      int parsedValue = doubleValue.toInt();
      int currentValue = max(0, parsedValue);
      ref.read(userProvider.notifier).updateAge(currentValue);
    } catch (e) {
      ref.read(userProvider.notifier).updateAge(0);
    }
  }

  void _onNameChanged() {
    String newName = _nameController.text;
    ref.read(userProvider.notifier).updateName(newName);
  }

  void _onAgeChanged() {
    try {
      String newAge = _ageController.text;
      double doubleValue = double.tryParse(newAge) ?? 0;
      int parsedValue = doubleValue.toInt();
      int currentValue = max(0, parsedValue);
      ref.read(userProvider.notifier).updateAge(currentValue);
    } catch (e) {
      ref.read(userProvider.notifier).updateAge(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final userName = ref.watch(userProvider.select((value) => value.name));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: HexColor("#2196F3"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Text("CustomTextField"),
            const SizedBox(height: 15),
            CustomTextField(onChanged: (value) => onChangeName(ref, value)),
            const SizedBox(height: 15),
            CustomTextField(
                type: TypeOption.number,
                onChanged: (value) => onChangeAge(ref, value)),
            const SizedBox(height: 15),
            const CustomDivider(color: Colors.black12),
            const SizedBox(height: 15),
            const Text("MyTextFieldWidget"),
            const SizedBox(height: 15),
            MyTextFieldWidget(
                value: user.name,
                onChanged: (value) => onChangeName(ref, value)),
            const SizedBox(height: 15),
            MyTextFieldWidget(
                type: Type2Option.currency,
                decimal: 0,
                value: user.age.toString(),
                onChanged: (value) => onChangeAge(ref, value)),
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
                controller: _ageController),
            const SizedBox(height: 15),
            Center(
              child: Text(user.age.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
