import 'product.dart';

void main() {
  print("Danh sách ban đầu:");
  Product.showAll();

  Product.add(
    Product(id: 4, name: 'Keyboard', image: 'keyboard.jpg', price: 50),
  );

  print("\nSau khi thêm:");
  Product.showAll();

  Product.edit(
    Product(id: 2, name: 'iPhone', image: 'iphone.jpg', price: 1000),
  );

  print("\nSau khi sửa:");
  Product.showAll();

  print("\nTìm kiếm:");
  print(Product.searchByName('lap'));

  print("\nFind by ID:");
  print(Product.findById(1));

  Product.increasePrice();

  print("\nSau khi tăng giá 10%:");
  Product.showAll();
}
