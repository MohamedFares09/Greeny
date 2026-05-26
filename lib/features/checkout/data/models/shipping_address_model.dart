import 'package:fruits_app/features/checkout/domain/entity/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? city;
  String? addressDetails;

  ShippingAddressModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.city,
    this.addressDetails,
  });

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      address: entity.address,
      city: entity.city,
      addressDetails: entity.addressDetails,
    );
  }

  @override
  String toString() {
    return '$city, $address, $addressDetails';
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'city': city,
      'addressDetails': addressDetails,
    };
  }
}
