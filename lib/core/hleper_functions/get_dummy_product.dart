import 'dart:io';

import 'package:fruits_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct(){
  return ProductEntity(
    name: 'Apple',
    price: 10,
    image: File(''),
    code: '1',
    description: '1',
    isFeatured: true, 
    expirationMonth: 1,
     numberOfCalories: 1,
      unitAmout: 1, 
      reviews: [],
      urlImage: null,
      
  );
}
List<ProductEntity> getDummyProducts(){
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}