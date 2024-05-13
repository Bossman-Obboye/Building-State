import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemProvider>(context, listen: false);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: midColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('Carts'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.listOfItems.length,
              itemBuilder: (contex, index) {
                final currentItem = provider.listOfItems[index];
                return Container(
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(width: 2, color: minorColor),
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(size.width * 0.03),
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.height * 0.01),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: size.height * 0.2,
                              width: size.width * 0.4,
                              color: currentItem.color ?? mainColor,
                              child: Center(
                                child: Text(
                                  currentItem.name,
                                  style: const TextStyle(
                                      color: white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03),
                              height: size.height * 0.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    currentItem.name,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${currentItem.price}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.only(bottom: 15),
                                    color: currentItem.color ??
                                        mainColor, // item color
                                    child: const Row(
                                      children: [
                                        Text(
                                          "Details    ",
                                          style: TextStyle(
                                              color: white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.arrow_forward, color: white)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: white,
                          child: Row(
                            children: [
                              const Icon(Icons.delete),
                              const Spacer(),
                              ImageIcon(
                                const AssetImage(
                                  "lib/second_project/my_assets/minus.png",
                                ),
                                size: size.width * 0.09,
                                color: callToAction,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              ImageIcon(
                                const AssetImage(
                                  "lib/second_project/my_assets/addition.png",
                                ),
                                size: size.width * 0.08,
                                color: callToAction,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: mainColor),
            onPressed: () {},
            child: const Center(child: Text('Buy now')),
          )
        ],
      ),
    );
  }
}
