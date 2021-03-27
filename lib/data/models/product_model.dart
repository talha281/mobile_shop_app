import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int? id;
  final String? companyName;
  final String? modelName;
  final String? rearCam;
  final String? frontCam;
  final String? ram;
  final String? internalMemory;
  final double? price;

  ProductModel({
    this.id,
    this.companyName,
    this.modelName,
    this.rearCam,
    this.frontCam,
    this.ram,
    this.internalMemory,
    this.price,
  });
  @override
  List<Object?> get props {
    return [
      id,
      companyName,
      modelName,
      rearCam,
      frontCam,
      ram,
      internalMemory,
      price,
    ];
  }

  ProductModel copyWith({
    int? id,
    String? companyName,
    String? modelName,
    String? rearCam,
    String? frontCam,
    String? ram,
    String? internalMemory,
    double? price,
  }) {
    return ProductModel(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      modelName: modelName ?? this.modelName,
      rearCam: rearCam ?? this.rearCam,
      frontCam: frontCam ?? this.frontCam,
      ram: ram ?? this.ram,
      internalMemory: internalMemory ?? this.internalMemory,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'companyName': companyName,
      'modelName': modelName,
      'rearCam': rearCam,
      'frontCam': frontCam,
      'ram': ram,
      'internalMemory': internalMemory,
      'price': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      companyName: map['companyName'],
      modelName: map['modelName'],
      rearCam: map['rearCam'],
      frontCam: map['frontCam'],
      ram: map['ram'],
      internalMemory: map['internalMemory'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
