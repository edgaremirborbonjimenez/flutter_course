import 'package:e_commerce/src/domain/models/Role.dart';

class User {
  int? id;
  String name;
  String lastName;
  String? email;
  String phone;
  String? password;
  String? image;
  String? notificationToken;
  List<Role>? roles;

  User({
    this.id,
    required this.name,
    required this.lastName,
    this.email,
    required this.phone,
    this.password,
    this.image,
    this.notificationToken,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? 0,
    name: json["name"] ?? '',
    lastName: json["lastname"] ?? '',
    email: json["email"] ?? '',
    phone: json["phone"] ?? '',
    password: json["password"] ?? '',
    image: json["image"] ?? '',
    notificationToken: json["notification_token"],
    roles: json["roles"] != null
        ? List<Role>.from(json["roles"].map((x) => Role.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastName,
    "email": email,
    "phone": phone,
    "password": password,
    "image": image,
    "notificationToken": notificationToken,
    "roles": roles != null
        ? List<dynamic>.from(roles!.map((x) => x.toJson()))
        : [],
  };
}
