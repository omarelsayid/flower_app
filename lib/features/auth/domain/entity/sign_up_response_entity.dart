class SignUpResponseEntity {
  SignUpResponseEntity({
      this.message, 
      this.user, 
      this.token,});

  String? message;
  User? user;
  String? token;

// SignUpResponseEntity copyWith({  String? message,
//   User? user,
//   String? token,
// }) => SignUpResponseEntity(  message: message ?? this.message,
//   user: user ?? this.user,
//   token: token ?? this.token,
// );

}

class User {
  User({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.gender, 
      this.phone, 
      this.photo, 
      this.role, 
      this.wishlist, 
      this.id, 
      this.addresses, 
      });

  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  List<dynamic>? wishlist;
  String? id;
  List<dynamic>? addresses;


// User copyWith({  String? firstName,
//   String? lastName,
//   String? email,
//   String? gender,
//   String? phone,
//   String? photo,
//   String? role,
//   List<dynamic>? wishlist,
//   String? id,
//   List<dynamic>? addresses,
//   String? createdAt,
// }) => User(  firstName: firstName ?? this.firstName,
//   lastName: lastName ?? this.lastName,
//   email: email ?? this.email,
//   gender: gender ?? this.gender,
//   phone: phone ?? this.phone,
//   photo: photo ?? this.photo,
//   role: role ?? this.role,
//   wishlist: wishlist ?? this.wishlist,
//   id: id ?? this.id,
//   addresses: addresses ?? this.addresses,
//   createdAt: createdAt ?? this.createdAt,
// );

}
