import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/components/mapper.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.currentProduct,
  });
  final Products currentProduct;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

bool addToCartClicked = false;

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final myFavorites = context.watch<ItemProvider>().favoriteProducts;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            addToCartClicked = false;
            Navigator.pop(context);
          },
        ),
        backgroundColor: mainColor,
        title: const Text('Details Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(size(context).width * 0.022),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size(context).height * 0.4,
              child: Center(
                child: Container(
                  color: mainColor,
                  child: Center(
                    child: Image.network(
                      formatImage(widget.currentProduct.images[0]),
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Image(
                        image: AssetImage(
                            'lib/second_project/my_assets/error.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size(context).height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size(context).width * 0.8,
                  child: Text(
                    widget.currentProduct.title,
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                    onTap: () {
                      if (!myFavorites.contains(widget.currentProduct)) {
                        context
                            .read<ItemProvider>()
                            .addToFavoriteProducts(widget.currentProduct);
                      } else {
                        context
                            .read<ItemProvider>()
                            .removeFromFavoriteProducts(widget.currentProduct);
                      }
                    },
                    child: Icon(Icons.favorite,
                        size: size(context).width * 0.11,
                        color: myFavorites.contains(widget.currentProduct)
                            ? callToAction
                            : minorColor))
              ],
            ),
            Text(
              widget.currentProduct.price.toStringAsFixed(2),
              style:
                  const TextStyle(fontSize: 23, fontWeight: FontWeight.normal),
            ),
            Text(
              widget.currentProduct.description,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Visibility(
              visible: (addToCartClicked),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ImageIcon(
                      const AssetImage(
                        "lib/second_project/my_assets/minus.png",
                      ),
                      size: size(context).width * 0.14,
                      color: callToAction,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '4',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.normal),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ImageIcon(
                        const AssetImage(
                          "lib/second_project/my_assets/addition.png",
                        ),
                        size: size(context).width * 0.12,
                        color: callToAction,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.delete),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      if (addToCartClicked = true) {
                        setState(() {
                          addToCartClicked = true;
                        });
                      }
                    },
                    child: const Text(
                      "Add to cart",
                      style: TextStyle(
                          color: callToAction, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

formatImage(String url) {
  if (!url.characters.first.contains(RegExp(r'[a-z]'))) {
    return url.substring(2, url.length - 1);
  }
  return url;
}
