import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:mobile_shop_app/data/models/product_model.dart';

class ProductRecordModel extends Equatable {
  final ProductModel? product;
  int quantity;

  ProductRecordModel({
    this.product,
    required this.quantity,
  });
  
  @override
  List<Object?> get props => [product, quantity];

  ProductRecordModel copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return ProductRecordModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product?.toMap(),
      'quantity': quantity,
    };
  }

  factory ProductRecordModel.fromMap(Map<String, dynamic> map) {
    return ProductRecordModel(
      product: ProductModel.fromMap(map['product']),
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductRecordModel.fromJson(String source) => ProductRecordModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
