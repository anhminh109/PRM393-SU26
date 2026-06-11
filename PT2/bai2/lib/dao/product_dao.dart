import '../model/product.dart';

class ProductDAO {
  static const List<Product> _mockProducts = [
    Product(
      id: 1,
      name: 'iPhone 15',
      description: 'Dien thoai Apple voi chip A17 Pro va camera cao cap.',
      price: 29990000,
      discountPercent: 8,
      image: 'assets/images/iphone 15.jpg',
    ),
    Product(
      id: 2,
      name: 'Samsung S24',
      description: 'Dien thoai Samsung voi man hinh Super Retina XDR.',
      price: 19990000,
      discountPercent: 10,
      image: 'assets/images/samsung-galaxy-s24.jpg',
    ),
    Product(
      id: 3,
      name: 'MacBook Air',
      description: 'Laptop Apple voi chip M2 va man hinh Retina.',
      price: 26990000,
      discountPercent: 7,
      image: 'assets/images/MacBook Air.jpg',
    ),
  ];

  Future<List<Product>> getAllProducts() async {
    await Future<void>.delayed(Duration.zero);

    return List<Product>.unmodifiable(_mockProducts);
  }

  Future<List<Product>> findProductByName(String keyword) async {
    final products = await getAllProducts();
    final normalizedKeyword = keyword.trim().toLowerCase();

    if (normalizedKeyword.isEmpty) {
      return products;
    }

    return products
        .where(
          (product) => product.name.toLowerCase().contains(normalizedKeyword),
        )
        .toList(growable: false);
  }
}
