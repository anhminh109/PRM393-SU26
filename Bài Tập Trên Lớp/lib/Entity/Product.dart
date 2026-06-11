class Product {
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.year,
    required this.fuelType,
    required this.drivetrain,
    required this.transmission,
    required this.acceleration,
    required this.power,
    required this.topSpeed,
    required this.consumption,
    required this.description,
    required this.highlights,
  });

  final int id;
  final String name;
  final String image;
  final double price;
  final int year;
  final String fuelType;
  final String drivetrain;
  final String transmission;
  final String acceleration;
  final String power;
  final String topSpeed;
  final String consumption;
  final String description;
  final List<String> highlights;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      year: json['year'] as int,
      fuelType: json['fuelType'] as String,
      drivetrain: json['drivetrain'] as String,
      transmission: json['transmission'] as String,
      acceleration: json['acceleration'] as String,
      power: json['power'] as String,
      topSpeed: json['topSpeed'] as String,
      consumption: json['consumption'] as String,
      description: json['description'] as String,
      highlights: List<String>.from(json['highlights'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'year': year,
      'fuelType': fuelType,
      'drivetrain': drivetrain,
      'transmission': transmission,
      'acceleration': acceleration,
      'power': power,
      'topSpeed': topSpeed,
      'consumption': consumption,
      'description': description,
      'highlights': highlights,
    };
  }
}
