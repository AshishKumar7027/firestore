class Product {
  String name;
  String description;
  double price;
  String color;
  String? id;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });

  // From JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      color: json['color'] as String,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name': name,
      'description': description,
      'price': price,
      'color': color,
    };
  }
}
