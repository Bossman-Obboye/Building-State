import 'dart:math';

import 'package:flutter/material.dart';

class Item {
  String name;
  double price;
  String? description;
  Color? color;

  Item({required this.name, required this.price, this.description, this.color});
}

List<Item> allItems = List.generate(
  500,
  (index) => Item(
    name: 'Item ${index + 1}',
    price: double.parse((Random().nextDouble() * 500).toStringAsFixed(2)),
    description: descriptions[Random().nextInt(descriptions.length)],
    color: Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1,
    ),
  ),
);






List<String> descriptions = [
  "Luxurious silk scarf, handcrafted with intricate patterns, adding a touch of sophistication to any outfit.",
  "Rugged DSLR camera backpack, weatherproofed and shock-resistant, featuring customizable dividers for organized storage and easy access to gear.",
  "Hand-painted ceramic mug set, each piece unique, microwave and dishwasher safe, perfect for enjoying your favorite beverages in style.",
  "Chic leather tote bag, spacious interior with multiple pockets, ideal for work or weekend getaways, crafted from premium full-grain leather.",
  "Exquisite crystal wine glasses, lead-free and dishwasher safe, showcasing an elegant stemware design, enhancing the enjoyment of fine wines.",
  "Compact travel umbrella, windproof and lightweight, featuring an automatic open/close button and a sturdy, ergonomic handle for comfortable grip.",
  "Antique brass table lamp, vintage-inspired design with intricate detailing, casting a warm glow and adding character to any room décor.",
  "Professional chef's knife set, precision-crafted from high-carbon stainless steel, ergonomically designed handles, perfect for culinary enthusiasts and aspiring chefs.",
  "Organic cotton bath towels, plush and absorbent, OEKO-TEX certified for eco-friendly production, adding a touch of luxury to your daily routine.",
  "Multi-functional smartwatch, with GPS tracking, heart rate monitoring, and sleep analysis, waterproof and Bluetooth compatible, keeping you connected and healthy on-the-go.",
  "Artisanal soy wax candles, hand-poured with essential oils, providing long-lasting fragrance and a warm ambiance, perfect for relaxation and meditation.",
  "Modern glass coffee table, tempered glass top with chrome-plated metal legs, sleek and minimalist design, adding a contemporary flair to your living space.",
  "Gourmet tea sampler set, featuring a variety of premium loose-leaf teas from around the world, packaged in elegant tins, ideal for tea connoisseurs and beginners alike.",
  "Vintage-inspired record player, with built-in speakers and Bluetooth connectivity, playing vinyl records or streaming music from your smartphone, a stylish addition to any music lover's collection.",
  "Eco-friendly yoga mat, made from natural rubber and biodegradable materials, non-toxic and non-slip surface, providing cushioned support and stability during yoga practice.",
  "Retro-style popcorn maker, air-popping technology, producing healthy and delicious popcorn in minutes, perfect for movie nights and entertaining guests.",
  "Aromatherapy essential oil diffuser, with color-changing LED lights and whisper-quiet operation, creating a serene atmosphere and promoting relaxation and well-being.",
  "Handmade bohemian macramé wall hanging, crafted from natural cotton rope, adding texture and warmth to your home décor, perfect for creating a cozy and inviting space.",
  "Professional-grade hair styling tool set, featuring ceramic tourmaline flat iron, curling wand, and hair dryer, achieving salon-quality results at home, suitable for all hair types.",
  "Gourmet chocolate truffle assortment, handcrafted with premium Belgian chocolate, featuring a variety of flavors and fillings, elegantly packaged for gifting or indulging in self-pampering.",
];
