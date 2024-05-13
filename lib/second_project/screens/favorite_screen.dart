import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/screens/details_screen.dart';
import 'package:building/second_project/state_managers/item_model.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final myFavorites = context.watch<ItemProvider>().favorites;
    return Scaffold(
      backgroundColor: midColor,
      body: myFavorites.isNotEmpty
          ? GridView.builder(
              itemCount: myFavorites.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: size.height * 0.01,
                  crossAxisSpacing: size.height * 0.01,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemBuilder: (context, index) {
                final Item currentItem = myFavorites[index];
                return GridTile(
                  header: Container(
                      color: mainColor, child: Text(currentItem.name)),
                  footer: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
            )
          : Center(
              child: SizedBox(
              height: returnSize(context).height *
                  0.4, // Specify the desired height
              width: 300, // Specify the desired width
              child: Card(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: returnSize(context).height *
                          0.02, // Specify the desired height
                    ),
                    const ImageIcon(
                      size: 120,
                      AssetImage('lib/second_project/my_assets/oops.png'),
                    ),
                    SizedBox(
                      height: returnSize(context).height *
                          0.02, 
                    ),
        // this is defined arrangement of text, don't alter any thing
                    Text(
                      '''Seems like we dont have any 
                  thing here yet.
      Let go shopping!''',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: returnSize(context).width * 0.04),
                    ),
                    SizedBox(
                      height: returnSize(context).height *
                          0.04, // Specify the desired height
                    ),
                    TextButton(
                        onPressed: () => context
                            .read<ItemProvider>()
                            .bottomNavBarItemOnTap(0),
                        child: const Text(
                          'Go to home',
                          style: TextStyle(color: callToAction),
                        ))
                    // Add more child widgets here
                  ],
                ),
              ),
            )),
    );
  }
}
