// To parse this JSON data, do
//
    // final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
    final int id;
    final String title;
    final int price;
    final String description;
    final List<String> images;
    final DateTime creationAt;
    final DateTime updatedAt;
    final Category category;

    Products({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.images,
        required this.creationAt,
        required this.updatedAt,
        required this.category,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        category: Category.fromJson(json["category"]??{}),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "category": category.toJson(),
    };
}

class Category {
    final int id;
    final Name name;
    final String image;
    final DateTime creationAt;
    final DateTime updatedAt;

    Category({
        required this.id,
        required this.name,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map[json["name"]]??Name.clothes,
        image: json["image"]??'',
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

enum Name {
    clothes,
    electronics,
    funiture,
    mikirovet,
    miscellaneous,
    shoes
}

final nameValues = EnumValues({
    "clothes": Name.clothes,
    "electronics": Name.electronics,
    "funiture": Name.funiture,
    "mikirovet": Name.mikirovet,
    "miscellaneous": Name.miscellaneous,
    "shoes": Name.shoes
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}