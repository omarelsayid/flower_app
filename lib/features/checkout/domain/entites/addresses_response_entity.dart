class AddressEntity {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;
  final String? id;

  AddressEntity({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.id,
  });

  // factory AddressEntity.fromJson(Map<String, dynamic> json) {
  //   return AddressEntity(
  //     street: json['street'],
  //     phone: json['phone'],
  //     city: json['city'],
  //     lat: json['lat'],
  //     long: json['long'],
  //     username: json['username'],
  //     id: json['_id'],
  //   );
  // }
}


