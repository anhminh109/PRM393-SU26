import '../Entity/Product.dart';

class ProductDAO {
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Porsche 911 Carrera',
      image: 'assets/images/images.jpg',
      price: 8870000000,
      year: 2026,
      fuelType: 'Xăng',
      drivetrain: 'Dẫn động cầu sau',
      transmission: 'Tự động PDK',
      acceleration: '3,9 giây',
      power: '290 kW / 394 PS',
      topSpeed: '294 km/h',
      consumption: '10,4 - 9,9 l/100 km',
      description:
          '911 Carrera là biểu tượng xe thể thao Porsche với động cơ 6 xi-lanh nằm ngang 3,0 lít tăng áp kép đặt phía sau, kết hợp khả năng vận hành hằng ngày và cảm giác lái phấn khích.',
      highlights: [
        'Động cơ boxer 3,0 lít',
        'PDK 8 cấp',
        'Sport Chrono',
        'Thiết kế 911 kinh điển',
      ],
    ),
    Product(
      id: 2,
      name: 'Porsche 718 Cayman',
      image: 'assets/images/images.jpg',
      price: 3850000000,
      year: 2024,
      fuelType: 'Xăng',
      drivetrain: 'Dẫn động cầu sau',
      transmission: 'Tự động / số sàn',
      acceleration: '5,1 giây',
      power: '220 kW / 300 PS',
      topSpeed: '275 km/h',
      consumption: '9,7 - 8,9 l/100 km',
      description:
          '718 Cayman mang tinh thần xe đua động cơ đặt giữa của Porsche, cân bằng giữa sự linh hoạt, âm thanh thể thao và trải nghiệm lái chính xác.',
      highlights: [
        'Động cơ đặt giữa',
        'Coupe 2 chỗ',
        'Thân xe gọn nhẹ',
        'Cảm giác lái thể thao',
      ],
    ),
    Product(
      id: 3,
      name: 'Porsche Taycan',
      image: 'assets/images/images.jpg',
      price: 4620000000,
      year: 2026,
      fuelType: 'Điện',
      drivetrain: 'Dẫn động cầu sau',
      transmission: 'Tự động',
      acceleration: '4,8 giây',
      power: '300 kW / 408 PS',
      topSpeed: '230 km/h',
      consumption: '19,1 - 16,7 kWh/100 km',
      description:
          'Taycan là mẫu xe thể thao thuần điện của Porsche, nổi bật với khả năng tăng tốc nhanh, vận hành êm và lượng phát thải CO2 khi vận hành bằng 0 g/km.',
      highlights: [
        'Thuần điện',
        'Launch Control',
        'Sạc nhanh DC',
        'CO2 0 g/km',
      ],
    ),
    Product(
      id: 4,
      name: 'Porsche Taycan 4S',
      image: 'assets/images/images.jpg',
      price: 5650000000,
      year: 2026,
      fuelType: 'Điện',
      drivetrain: 'Dẫn động 4 bánh',
      transmission: 'Tự động',
      acceleration: '3,7 giây',
      power: '400 kW / 544 PS',
      topSpeed: '250 km/h',
      consumption: '20,1 - 17,6 kWh/100 km',
      description:
          'Taycan 4S tăng thêm lực kéo nhờ hệ dẫn động 4 bánh, giữ chất thể thao đặc trưng Porsche nhưng phù hợp cho sử dụng hằng ngày.',
      highlights: [
        'Dẫn động 4 bánh',
        'Overboost',
        'Launch Control',
        'Hiệu suất điện cao',
      ],
    ),
    Product(
      id: 5,
      name: 'Porsche Taycan Turbo',
      image: 'assets/images/images.jpg',
      price: 7890000000,
      year: 2026,
      fuelType: 'Điện',
      drivetrain: 'Dẫn động 4 bánh',
      transmission: 'Tự động',
      acceleration: '2,7 giây',
      power: '650 kW / 884 PS',
      topSpeed: '260 km/h',
      consumption: '20,0 - 17,7 kWh/100 km',
      description:
          'Taycan Turbo là biến thể hiệu năng cao của dòng Taycan, tập trung vào khả năng tăng tốc tức thì và trải nghiệm xe điện thể thao.',
      highlights: [
        'Hiệu năng Turbo',
        'Tăng tốc rất nhanh',
        'Dẫn động 4 bánh',
        'Khí thải 0 g/km',
      ],
    ),
    Product(
      id: 6,
      name: 'Porsche Panamera',
      image: 'assets/images/images.jpg',
      price: 6310000000,
      year: 2027,
      fuelType: 'Xăng',
      drivetrain: 'Dẫn động cầu sau',
      transmission: 'Tự động PDK',
      acceleration: '5,1 giây',
      power: '260 kW / 353 PS',
      topSpeed: '272 km/h',
      consumption: '10,4 - 9,6 l/100 km',
      description:
          'Panamera kết hợp sự thoải mái của sedan hạng sang với cảm giác lái thể thao, dùng động cơ V6 tăng áp kép 2,9 lít và hộp số PDK 8 cấp.',
      highlights: [
        'Sedan thể thao',
        'V6 tăng áp kép',
        'PDK 8 cấp',
        'Khoang lái tiện nghi',
      ],
    ),
    Product(
      id: 7,
      name: 'Porsche Panamera GTS',
      image: 'assets/images/images.jpg',
      price: 8580000000,
      year: 2027,
      fuelType: 'Xăng',
      drivetrain: 'Dẫn động 4 bánh',
      transmission: 'Tự động PDK',
      acceleration: '3,8 giây',
      power: '368 kW / 500 PS',
      topSpeed: '302 km/h',
      consumption: '12,4 - 11,6 l/100 km',
      description:
          'Panamera GTS nhấn mạnh chất thể thao với sức mạnh lớn hơn, hệ dẫn động 4 bánh và khả năng vận hành cân bằng giữa đường trường và đường đua.',
      highlights: [
        'GTS thể thao',
        'Dẫn động 4 bánh',
        'PDK 8 cấp',
        'Khung gầm hiệu năng',
      ],
    ),
    Product(
      id: 8,
      name: 'Porsche Macan Electric',
      image: 'assets/images/images.jpg',
      price: 3220000000,
      year: 2026,
      fuelType: 'Điện',
      drivetrain: 'Dẫn động cầu sau',
      transmission: 'Tự động',
      acceleration: '5,7 giây',
      power: '265 kW / 360 PS',
      topSpeed: '220 km/h',
      consumption: 'Tầm hoạt động 548 - 641 km',
      description:
          'Macan Electric là SUV thuần điện nhỏ gọn của Porsche, kết hợp tính thực dụng, thiết kế thể thao và tầm hoạt động điện dài.',
      highlights: [
        'SUV điện',
        'Launch Control',
        'Tầm hoạt động dài',
        'CO2 0 g/km',
      ],
    ),
    Product(
      id: 9,
      name: 'Porsche Cayenne',
      image: 'assets/images/images.jpg',
      price: 5560000000,
      year: 2026,
      fuelType: 'Xăng',
      drivetrain: 'Dẫn động 4 bánh',
      transmission: 'Tự động',
      acceleration: '5,7 giây',
      power: '260 kW / 353 PS',
      topSpeed: '248 km/h',
      consumption: '11,7 - 10,6 l/100 km',
      description:
          'Cayenne là SUV thể thao đa dụng của Porsche, có hệ dẫn động 4 bánh, không gian rộng và hiệu năng đủ mạnh cho nhiều nhu cầu di chuyển.',
      highlights: [
        'SUV thể thao',
        'Dẫn động 4 bánh',
        'Sport Chrono',
        'Không gian rộng',
      ],
    ),
    Product(
      id: 10,
      name: 'Porsche Cayenne S',
      image: 'assets/images/images.jpg',
      price: 6980000000,
      year: 2026,
      fuelType: 'Xăng',
      drivetrain: 'Dẫn động 4 bánh',
      transmission: 'Tự động',
      acceleration: '4,7 giây',
      power: '349 kW / 474 PS',
      topSpeed: '273 km/h',
      consumption: '12,6 - 12,0 l/100 km',
      description:
          'Cayenne S tăng sức mạnh và phản hồi vận hành, phù hợp người dùng muốn một SUV Porsche rộng rãi nhưng vẫn có hiệu năng cao.',
      highlights: [
        'Bản S mạnh mẽ',
        'Dẫn động 4 bánh',
        'Tăng tốc 4,7 giây',
        'SUV hiệu năng',
      ],
    ),
  ];

  List<Product> getAll() {
    return List<Product>.from(_products);
  }

  Product? findById(int id) {
    for (final product in _products) {
      if (product.id == id) {
        return product;
      }
    }
    return null;
  }

  List<Product> searchByName(String keyword) {
    final text = keyword.toLowerCase();
    return _products
        .where((product) => product.name.toLowerCase().contains(text))
        .toList();
  }

  void addProduct(Product product) {
    _products.add(product);
  }

  bool updateProduct(Product product) {
    final index = _products.indexWhere((item) => item.id == product.id);
    if (index == -1) {
      return false;
    }
    _products[index] = product;
    return true;
  }

  bool deleteProduct(int id) {
    final index = _products.indexWhere((product) => product.id == id);
    if (index == -1) {
      return false;
    }
    _products.removeAt(index);
    return true;
  }
}
