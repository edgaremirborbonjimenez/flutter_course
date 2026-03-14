class Category {
  int? id;
  String name;
  String description;
  String? image;

  Category({
    this.id,
    required this.name,
    required this.description,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "description": description,
  };
}
