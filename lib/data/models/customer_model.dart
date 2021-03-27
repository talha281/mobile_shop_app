import 'dart:convert';

import 'package:equatable/equatable.dart';

class CustomerModel extends Equatable {
  //whenever customer purchase item we will store customerId to prefs and clear previous id
  //for next customer we will get customerId of the last customer from prefs and adding +1 to the
  //current customer id store the id.

  final int? customerId;
  final String? customerName;
  final String? email;
  final String? contactNumber;
  final String? companyName;
  final String? modelName;

  CustomerModel({
    this.customerId,
    this.customerName,
    this.email,
    this.contactNumber,
    this.companyName,
    this.modelName,
  });
  @override
  List<Object?> get props {
    return [
      customerId,
      customerName,
      email,
      contactNumber,
      companyName,
      modelName,
    ];
  }

  CustomerModel copyWith({
    int? customerId,
    String? customerName,
    String? email,
    String? contactNumber,
    String? companyName,
    String? modelName,
  }) {
    return CustomerModel(
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      email: email ?? this.email,
      contactNumber: contactNumber ?? this.contactNumber,
      companyName: companyName ?? this.companyName,
      modelName: modelName ?? this.modelName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'customerName': customerName,
      'email': email,
      'contactNumber': contactNumber,
      'companyName': companyName,
      'modelName': modelName,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      customerId: map['customerId'],
      customerName: map['customerName'],
      email: map['email'],
      contactNumber: map['contactNumber'],
      companyName: map['companyName'],
      modelName: map['modelName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
