// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// @immutable
// class User {
//   final String name;
//   final int age;

//   const User({
//     required this.name,
//     required this.age,
//   });
// }

// class UserNotifier extends StateNotifier<User> {
//   UserNotifier(super.state);

//   void updateName(String n) {
//     state = User(name: n, age: state.age);
//   }
// }

@immutable
class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, age: $age)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);
  // UserNotifier() : super(const User(name: "", age: 0));

  void updateName(String n) {
    state = state.copyWith(name: n);
  }

  void updateAge(int n) {
    state = state.copyWith(age: n);
  }
}

class UserNotifierChange extends ChangeNotifier {
  User user = const User(name: "", age: 0);

  void updateName(String n) {
    user = user.copyWith(name: n);
    notifyListeners(); // necessary
  }

  void updateAge(int a) {
    user = user.copyWith(age: a);
    notifyListeners(); // necessary
  }
}

final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<User> fetchUserData() {
    const url = "https://jsonplaceholder.typicode.com/users/1";
    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }
}
