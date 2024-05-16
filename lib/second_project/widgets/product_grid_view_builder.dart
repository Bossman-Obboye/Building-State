import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/components/mapper.dart';
import 'package:building/second_project/screens/details_screen.dart';
import 'package:building/second_project/screens/home_screen.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGridViewBuilder extends StatelessWidget {
  const ProductGridViewBuilder({
    super.key,
    required this.products,
  });

  final List<Products> products;

  @override
  Widget build(BuildContext context) {
    final myFavorites = context.watch<ItemProvider>().favoriteProducts;
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: size(context).height * 0.01,
          crossAxisSpacing: size(context).height * 0.01,
          crossAxisCount: 2,
          childAspectRatio: 0.8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemBuilder: (context, index) {
        final Products currentProduct = products[index];
        bool isImageUrlValid(String imageUrl) {
          RegExp regExp = RegExp(
            r'^(http|https)://',
            caseSensitive: false,
            multiLine: false,
          );
          return regExp.hasMatch(imageUrl);
        }

        return !isImageUrlValid(formatImage(currentProduct.images[0]))
            ? null
            : GridTile(
                header: Container(
                  color: mainColor,
                  child: Text(currentProduct.title),
                ),
                footer: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${currentProduct.price}'),
                      InkWell(
                        onTap: () {
                          if (myFavorites.contains(currentProduct)) {
                            context
                                .read<ItemProvider>()
                                .removeFromFavoriteProducts(currentProduct);
                          } else {
                            context
                                .read<ItemProvider>()
                                .addToFavoriteProducts(currentProduct);
                          }
                        },
                        child: Icon(
                          Icons.favorite,
                          color: myFavorites.contains(currentProduct)
                              ? callToAction
                              : minorColor,
                        ),
                      ),
                    ],
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(currentProduct: currentProduct)));
                  },
                  child: Container(
                    color: mainColor,
                    child: Center(
                      child: Image.network(
                        formatImage(currentProduct.images[0]),
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
    );
  }
}

formatImage(String url) {
  if (!url.characters.first.contains(RegExp(r'[a-z]'))) {
    return url.substring(2, url.length - 1);
  }
  return url;
}
