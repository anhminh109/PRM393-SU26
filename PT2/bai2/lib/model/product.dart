class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final double discountPercent;
  final String image;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discountPercent,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      discountPercent: (json['discountPercent'] as num).toDouble(),
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discountPercent': discountPercent,
      'image': image,
    };
  }

  double get finalPrice => price - (price * discountPercent / 100);
}
