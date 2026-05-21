class Product {
  int id;
  String name;
  String image;
  double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'].toDouble(),
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price)';
  }

  static List<Product> products = [
    Product(id: 1, name: 'Laptop', image: 'laptop.jpg', price: 1500),
    Product(id: 2, name: 'Phone', image: 'phone.jpg', price: 800),
    Product(id: 3, name: 'Mouse', image: 'mouse.jpg', price: 20),
  ];

  static void add(Product product) {
    products.add(product);
  }

  static void edit(Product product) {
    int index = products.indexWhere((p) => p.id == product.id);

    if (index != -1) {
      products[index] = product;
    }
  }

  static List<Product> searchByName(String keyword) {
    return products
        .where((p) => p.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  static Product? findById(int id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  static void increasePrice() {
    products = products.map((p) {
      return Product(
        id: p.id,
        name: p.name,
        image: p.image,
        price: p.price * 1.1,
      );
    }).toList();
  }

  static void showAll() {
    for (var p in products) {
      print(p);
    }
  }
}
