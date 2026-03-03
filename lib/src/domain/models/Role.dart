class Role {
  String id;
  String name;
  String image;
  String route;
  DateTime created_at;
  DateTime updated_at;

  Role({
    required this.id,
    required this.name,
    required this.image,
    required this.route,
    required this.created_at,
    required this.updated_at,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json['id'],
    name: json['name'] ?? '',
    image: json['image'] ?? '',
    route: json['route'] ?? '',
    created_at: DateTime.parse(json['created_at']),
    updated_at: DateTime.parse(json['updated_at']),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "route": route,
    "created_at": created_at.toIso8601String(),
    "updated_at": updated_at.toIso8601String(),
  };
}
