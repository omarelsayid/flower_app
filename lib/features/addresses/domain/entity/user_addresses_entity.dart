import 'package:equatable/equatable.dart';

class UserAddressesEntity {
  final String? message;
  final List<Address>? addresses;

  UserAddressesEntity({
    this.message,
    this.addresses,
  });
}

class Address extends Equatable {
  final String? id;
  final String? street;
  final String? phone;
  final String? city;
  final String? area;
  final String? lat;
  final String? long;
  final String? username;

  Address({
    this.id,
    this.street,
    this.phone,
    this.city,
    this.area,
    this.lat,
    this.long,
    this.username,
  });

  @override
  List<Object?> get props => [
    id,
    street,
    phone,
    city,
    area,
    lat,
    long,
    username,
  ];

  Address copyWith({
    String? id,
    String? street,
    String? phone,
    String? city,
    String? area,
    String? lat,
    String? long,
    String? username,
  }) {
    return Address(
      id: id ?? this.id,
      street: street ?? this.street,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      area: area ?? this.area,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      username: username ?? this.username,
    );
  }
}
