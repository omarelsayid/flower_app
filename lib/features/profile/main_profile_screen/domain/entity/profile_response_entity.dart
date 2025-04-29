class ProfileResponseEntity {
  ProfileResponseEntity({this.message, this.user});

  String? message;
  UserEntity? user;
}

/// _id : "67dc96c7836ee8be70624cdc"
/// firstName : "fatenn"
/// lastName : "khalid"
/// email : "faten505@gmail.com"
/// gender : "female"
/// phone : "+967775059405"
/// photo : "https://flower.elevateegy.com/uploads/default-profile.png"
/// role : "user"
/// wishlist : []
/// addresses : []
/// createdAt : "2025-03-20T22:29:27.885Z"

class UserEntity {
  UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.addresses,
  });

  // UserEntity.fromJson(dynamic json) {
  //   id = json['_id'];
  //   firstName = json['firstName'];
  //   lastName = json['lastName'];
  //   email = json['email'];
  //   gender = json['gender'];
  //   phone = json['phone'];
  //   photo = json['photo'];
  //   role = json['role'];
  //   if (json['wishlist'] != null) {
  //     wishlist = [];
  //     json['wishlist'].forEach((v) {
  //       wishlist?.add(Dynamic.fromJson(v));
  //     });
  //   }
  //   if (json['addresses'] != null) {
  //     addresses = [];
  //     json['addresses'].forEach((v) {
  //       addresses?.add(Dynamic.fromJson(v));
  //     });
  //   }
  // }
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  List<dynamic>? wishlist;
  List<dynamic>? addresses;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['_id'] = id;
  //   map['firstName'] = firstName;
  //   map['lastName'] = lastName;
  //   map['email'] = email;
  //   map['gender'] = gender;
  //   map['phone'] = phone;
  //   map['photo'] = photo;
  //   map['role'] = role;
  //   if (wishlist != null) {
  //     map['wishlist'] = wishlist?.map((v) => v.toJson()).toList();
  //   }
  //   if (addresses != null) {
  //     map['addresses'] = addresses?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}
