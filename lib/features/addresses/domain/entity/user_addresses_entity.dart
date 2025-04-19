/// message : "success"
/// addresses : []

class UserAddressesEntity {
  final String? message;
  final List<Address>? addresses;

  UserAddressesEntity({
    this.message,
    this.addresses,
  });
}
class Address {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;
  final String? id;

  Address({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.id,
  });

}
