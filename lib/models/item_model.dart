class ItemModel {
  final int id;
  final String name;
  final double price;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }
}