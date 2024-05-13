import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/screens/details_screen.dart';
import 'package:building/second_project/state_managers/item_model.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfitems = context.watch<ItemProvider>().listOfItems;
    final myFavorites = context.watch<ItemProvider>().favorites;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: midColor,
      body: GridView.builder(
        itemCount: listOfitems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: size.height * 0.01,
            crossAxisSpacing: size.height * 0.01,
            crossAxisCount: 2,
            childAspectRatio: 0.8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemBuilder: (context, index) {
          final Item currentItem = listOfitems[index];
          return GridTile(
            header: Container(color: mainColor, child: Text(currentItem.name)),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${currentItem.price}'),
                  InkWell(
                      onTap: () {
                        if (!myFavorites.contains(currentItem)) {
                          context
                              .read<ItemProvider>()
                              .addToFavorite(currentItem);
                        } else {
                          context
                              .read<ItemProvider>()
                              .removeFromFavorite(currentItem);
                        }
                      },
                      child: Icon(Icons.favorite,
                          color: myFavorites.contains(currentItem)
                              ? callToAction
                              : minorColor))
                ],
              ),
            ),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    item: currentItem,
                  ),
                ),
              ),
              child: Container(
                color: currentItem.color ?? minorColor,
                child: Center(
                  child: Text(currentItem.name,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: white)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
