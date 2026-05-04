class ShippingAddressEntity {
   String ? name;
   String ? email;
   String ? phoneNumber;
   String ? address;
   String ? city;
   String ? addressDetails;

  ShippingAddressEntity({
     this.name,
     this.email,
     this.phoneNumber,
     this.address,
     this.city,
     this.addressDetails,
  });
  @override
  String toString() {
    return '$city, $address, $addressDetails';
  }
}