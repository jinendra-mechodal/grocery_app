// product_data.dart
class Product {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;

  Product({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
  });
}

// List of products
List<Product> products = [
  Product(
    imagePath: 'assets/images/pd-1.png',
    title: 'Organic Grape',
    subtitle: 'Fruits',
    price: '₹ 5.60',
  ),
  Product(
    imagePath: 'assets/images/pd-2.png',
    title: 'Fresh Pomegranate',
    subtitle: 'Fruits',
    price: '₹ 6.45',
  ),
  Product(
    imagePath: 'assets/images/pd-3.png',
    title: 'Watermelon',
    subtitle: 'Fruits',
    price: '₹ 1.99',
  ),

  Product(
    imagePath: 'assets/images/pd-4.png',
    title: 'Organic Kiwi',
    subtitle: 'Fruits',
    price: '₹ 6.45',
  ),
  Product(
    imagePath: 'assets/images/pd-5.png',
    title: 'Coconut',
    subtitle: 'Fruits',
    price: '₹ 3.50',
  ),
  Product(
    imagePath: 'assets/images/pd-6.png',
    title: 'Fresh Mango',
    subtitle: 'Fruits',
    price: '₹ 3.79',
  ),

];
