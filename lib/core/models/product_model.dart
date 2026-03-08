import 'dart:io';

import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? urlImage;
  final int expirationMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmout;
  final num sellCount;
  final int avgRating = 0;
  final int ratingCount = 0;
  final List<ReviewModel> reviews;
  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.expirationMonth,
    required this.numberOfCalories,
    required this.unitAmout,
    required this.sellCount,
    this.isOrganic = false,
    this.urlImage,
    required this.reviews,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      isFeatured: json['isFeatured'],
      urlImage: json['urlImage'],
      expirationMonth: json['expirationMonth'],
      numberOfCalories: json['numberOfCalories'],
      unitAmout: json['unitAmout'],
      isOrganic: json['isOrganic'],
      reviews: json['reviews'].map((e) => ReviewModel.fromJson(e)).toList(),
      sellCount: json['sellCount'],
    );
  }
  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'urlImage': urlImage,
      'expirationMonth': expirationMonth,
      'numberOfCalories': numberOfCalories,
      'unitAmout': unitAmout,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'sellCount': sellCount,
    };
  }
}
