import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/state_managers/item_model.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.item,
  });
  final Item item;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

bool addToCartClicked = false;

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final myFavorites = context.watch<ItemProvider>().favorites;
    final Size size = MediaQuery.of(context).size;
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
        padding: EdgeInsets.all(size.width * 0.022),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.4,
              color: widget.item.color,
              child: Center(
                child: Text(
                  widget.item.name,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.item.name,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                InkWell(
                    onTap: () {
                      if (!myFavorites.contains(widget.item)) {
                        context.read<ItemProvider>().addToFavorite(widget.item);
                      } else {
                        context
                            .read<ItemProvider>()
                            .removeFromFavorite(widget.item);
                      }
                    },
                    child: Icon(Icons.favorite,
                        size: size.width * 0.11,
                        color: myFavorites.contains(widget.item)
                            ? callToAction
                            : minorColor))
              ],
            ),
            Text(
              widget.item.price.toStringAsFixed(2),
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
            ),
            Text(
              widget.item.description ?? 'No Information',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      size: size.width * 0.14,
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
                        size: size.width * 0.12,
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
                      style:
                          TextStyle(color: white, fontWeight: FontWeight.bold),
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
