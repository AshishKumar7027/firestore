class User {
  String? id;
  String name;
  int age;
  String city;

  User({
    this.id,
    required this.name,
    required this.age,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] as String?,
        name: json['name']as String,
        age: json['age']as int,
        city: json['city']as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'city': city,
    };
  }
}