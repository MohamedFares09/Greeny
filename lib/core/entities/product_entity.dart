import 'dart:io';
import 'package:fruits_app/core/entities/review_entity.dart';


class ProductEntity {
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
  final List<ReviewEntity> reviews;
  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.isOrganic = false,
    this.urlImage,
    required this.expirationMonth,
    required this.numberOfCalories,
    required this.unitAmout,
    required this.reviews,
  });
}
