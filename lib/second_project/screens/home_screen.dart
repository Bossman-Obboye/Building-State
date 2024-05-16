import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/components/mapper.dart';
// import 'package:building/second_project/screens/details_screen.dart';

import 'package:building/second_project/state_managers/provider.dart';
// import 'package:building/second_project/widgets/gridview_builder.dart';
import 'package:building/second_project/widgets/if__empty_notice_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Products> products = [];

  fetchProducts() async {
    final results = await context.read<ItemProvider>().allProducts;
    setState(() => products = results);
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    // final listOfitems = context.watch<ItemProvider>().listOfItems;
    return Scaffold(
        backgroundColor: midColor,
        body: products.isEmpty
            ? const If_EmptyNoticeCard(
                navigateToHome: false,
                // this is defined arrangement of text, pls don't alter anything
                message: '''Seems like we dont have any 
            thing here yet.
          Please visit us later!''',
              )
            : GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: size(context).height * 0.01,
                    crossAxisSpacing: size(context).height * 0.01,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemBuilder: (context, index) {
                  final Products currentItem = products[index];
                  bool isImageUrlValid(String imageUrl) {
                    RegExp regExp = RegExp(
                      r'^(http|https)://',
                      caseSensitive: false,
                      multiLine: false,
                      
                    );
                    return regExp.hasMatch(imageUrl);
                  }

                  return !isImageUrlValid(formatImage(currentItem.images[0]))
                      ? null
                      : GridTile(
                          header: Container(
                            color: mainColor,
                            child: Text(currentItem.title),
                          ),
                          footer: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            color: white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$${currentItem.price}'),
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.favorite,
                                    color: minorColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              color: mainColor,
                              child: Center(
                                child: Image.network(
                                    formatImage(currentItem.images[0]),
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) =>
                                
                                        const Image(
                                      image: AssetImage(
                                          'lib/second_project/my_assets/error.png'),
                                    ),
                                    ),
                              ),
                            ),
                          ),
                        );
                },
              ));
  }
}

formatImage(String url) {
  if (!url.characters.first.contains(RegExp(r'[a-z]'))) {
    return url.substring(2, url.length - 1);
  }
  return url;
}
