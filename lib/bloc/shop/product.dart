

class Product {
  final String slug;
  final String name;
  final String url;

  Product({required this.slug, required this.name, required this.url});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      slug: json['slug'],
      name: json['name'],
      url: json['url'],
    );
  }
}
