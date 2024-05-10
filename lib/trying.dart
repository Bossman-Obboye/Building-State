import 'dart:convert';

import 'package:building/first_project/models/model_four.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Trying extends StatelessWidget {
  const Trying({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future loadJsonData() async {
    String pullFromJson = await rootBundle.loadString('assets/data/file4.json');
    final dataFromJson = jsonDecode(pullFromJson);
    final ModelFour1 itemslist = ModelFour1.fromJson(dataFromJson);

    setState(() {
      listOfProducts = itemslist.items;
    });
  }

  List<Item> listOfProducts = [];
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: listOfProducts.isEmpty
          ? const Scaffold(
              body: Center(),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.amber,
                leading: const Icon(Icons.menu, size: 30),
                title: const Text("MyApp",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                actions: [
                  const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: size.width * 0.015,
                  ),
                  const Icon(
                    Icons.abc,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  )
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: listOfProducts.length,
                      itemBuilder: (context, index) => Display(
                        size: size,
                        itemName: listOfProducts[index].name,
                        itemPrice: listOfProducts[index].price,
                        image: listOfProducts[index].image,
                        description: listOfProducts[index].description,
                      ),
                    ),
                  ),
                  // Display(
                  //   size: size,
                  //   itemName: listOfProducts[0].name,
                  //   itemPrice: listOfProducts[0].price,
                  //   image: listOfProducts[0].image,
                  //   description: listOfProducts[0].description,
                  // ),
                ],
              ),
            ),
    );
  }
}

class Display extends StatelessWidget {
  const Display({
    super.key,
    required this.size,
    required this.itemName,
    required this.itemPrice,
    required this.image,
    required this.description,
  });

  final Size size;
  final String itemName;
  final double itemPrice;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(size.width * 0.02),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2)),
      height: size.height * 0.4,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(size.width * 0.02),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 216, 206, 176),
              borderRadius:
                  BorderRadiusDirectional.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  itemName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                Text(
                  "Price: ${(itemPrice).toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color:  Color.fromARGB(255, 124, 92, 92),
                      fontSize: 20),
                ),
                const Spacer(),
                const Icon(Icons.forward, color: Colors.red)
              ],
            ),
          ),
          Image(height: size.height * 0.25, image: AssetImage(image)),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(description),
          ))
        ],
      ),
    );
  }
}
