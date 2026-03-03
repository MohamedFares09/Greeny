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
    this.isOrganic = false,
    this.urlImage,
    required this.reviews,
  });
  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      image: entity.image,
      isFeatured: entity.isFeatured,
      urlImage: entity.urlImage,
      expirationMonth: entity.expirationMonth,
      numberOfCalories: entity.numberOfCalories,
      unitAmout: entity.unitAmout,
      isOrganic: entity.isOrganic,
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
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
    };
  }
}
