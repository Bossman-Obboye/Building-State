class Item {
  final String image;
  final String name;
  final double price;
  final String description;

  Item({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      image: json['image'].toString(),
      name: json['name'].toString(),
      price: double.tryParse(json['price'].toString()) ?? 0,
      description: json['description'].toString(),
    );
  }
}

class ModelFour1 {
  final List<Item> items;

  ModelFour1({
    required this.items,
  });

  factory ModelFour1.fromJson(Map<String, dynamic> json) {
    List<dynamic> itemsJson = json['items'];
    // List<Item> items =
    // itemsJson.map((eachItem) => Item.fromJson(eachItem)) as List<Item>;
    List<Item> items = List.generate(
        itemsJson.length, (index) => Item.fromJson(itemsJson[index]));

    return ModelFour1(
      items: items,
    );
  }
}
