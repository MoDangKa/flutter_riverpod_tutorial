import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class Customer {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  Customer(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  Customer.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["username"] is String) {
      username = json["username"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["address"] is Map) {
      address =
          json["address"] == null ? null : Address.fromJson(json["address"]);
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["website"] is String) {
      website = json["website"];
    }
    if (json["company"] is Map) {
      company =
          json["company"] == null ? null : Company.fromJson(json["company"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["username"] = username;
    _data["email"] = email;
    if (address != null) {
      _data["address"] = address?.toJson();
    }
    _data["phone"] = phone;
    _data["website"] = website;
    if (company != null) {
      _data["company"] = company?.toJson();
    }
    return _data;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["catchPhrase"] is String) {
      catchPhrase = json["catchPhrase"];
    }
    if (json["bs"] is String) {
      bs = json["bs"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["catchPhrase"] = catchPhrase;
    _data["bs"] = bs;
    return _data;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    if (json["street"] is String) {
      street = json["street"];
    }
    if (json["suite"] is String) {
      suite = json["suite"];
    }
    if (json["city"] is String) {
      city = json["city"];
    }
    if (json["zipcode"] is String) {
      zipcode = json["zipcode"];
    }
    if (json["geo"] is Map) {
      geo = json["geo"] == null ? null : Geo.fromJson(json["geo"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["street"] = street;
    _data["suite"] = suite;
    _data["city"] = city;
    _data["zipcode"] = zipcode;
    if (geo != null) {
      _data["geo"] = geo?.toJson();
    }
    return _data;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    if (json["lat"] is String) {
      lat = json["lat"];
    }
    if (json["lng"] is String) {
      lng = json["lng"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lat"] = lat;
    _data["lng"] = lng;
    return _data;
  }
}

final userRepositoryProvider = Provider((ref) => CustomerRepository());

class CustomerRepository {
  Future<Customer> fetchCustomerData(String customerNo) {
    String url = 'https://jsonplaceholder.typicode.com/users/$customerNo';
    return http
        .get(Uri.parse(url))
        .then((res) => Customer.fromJson(jsonDecode(res.body)));
  }
}
