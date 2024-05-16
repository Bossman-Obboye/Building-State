import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:building/second_project/widgets/cart_screens.dart';
import 'package:building/second_project/widgets/list_tile_children.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: midColor,
      body: Consumer<ItemProvider>(
        builder: (context, provider, child) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            ListViewButtonForFavoriteScreen(
              leading: Icon(
                Icons.favorite,
                color: callToAction,
                size: size(context).width * 0.12,
              ),
              title: "Favorites",
              subtitle: 'Sort by \'Favorite\'',
              onTap: () =>
                  context.read<ItemProvider>().bottomNavBarItemOnTap(1),
            ),
            SizedBox(
              height: size(context).height * 0.03,
            ),
            ListViewButtonForFavoriteScreen(
              title: "Name",
              subtitle: 'Sort by \'Names\'',
              leading: ImageIcon(
                color: minorColor,
                const AssetImage(
                  'lib/second_project/my_assets/letter-n.png',
                ),
                size: size(context).width * 0.12,
              ),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => BottomSheet(
                  onClosing: () {},
                  backgroundColor: midColor,
                  builder: (context) => Container(
                    padding: EdgeInsets.only(
                      left: size(context).height * 0.02,
                      right: size(context).height * 0.02,
                      top: size(context).height * 0.02,
                    ),
                    child: const Column(
                      children: [
                        ListTileChildren(
                          isForPrice: false,
                          initialValueForTheFilter: 1,
                          finalValueForTheFilter: 100,
                          text: '''View items with the names ranging from
                        - Item 1 to Item 100''',
                        ),
                        ListTileChildren(
                          isForPrice: false,
                          initialValueForTheFilter: 101,
                          finalValueForTheFilter: 200,
                          text: '''View items with the names ranging from
                        - Item 101 to Item 200''',
                        ),
                        ListTileChildren(
                          isForPrice: false,
                          initialValueForTheFilter: 201,
                          finalValueForTheFilter: 300,
                          text: '''View items with the names ranging from
                        - Item 201 to Item 300''',
                        ),
                        ListTileChildren(
                          isForPrice: false,
                          initialValueForTheFilter: 301,
                          finalValueForTheFilter: 400,
                          text: '''View items with the names ranging from
                        - Item 301 to Item 400''',
                        ),
                        ListTileChildren(
                          isForPrice: false,
                          initialValueForTheFilter: 401,
                          finalValueForTheFilter: 500,
                          text: '''View items with the names ranging from
                        - Item 401 to Item 500''',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size(context).height * 0.03,
            ),
            ListViewButtonForFavoriteScreen(
              title: "Price",
              subtitle: 'Sort by \'Price\'',
              leading: ImageIcon(
                color: minorColor,
                const AssetImage(
                  'lib/second_project/my_assets/coin.png',
                ),
                size: size(context).width * 0.12,
              ),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => BottomSheet(
                  onClosing: () {},
                  backgroundColor: midColor,
                  builder: (context) => Container(
                    padding: EdgeInsets.only(
                      left: size(context).height * 0.02,
                      right: size(context).height * 0.02,
                      top: size(context).height * 0.02,
                    ),
                    child: const Column(
                      children: [
                        ListTileChildren(
                          text: '''View items with their prices ranging from 
                        - \$0.00 to \$99.99''',
                          finalValueForTheFilter: 99.99,
                          initialValueForTheFilter: 0,
                        ),
                        ListTileChildren(
                          initialValueForTheFilter: 100,
                          finalValueForTheFilter: 199.99,
                          text: '''View items with their prices ranging from
                        - \$100.00 to \$199.99''',
                        ),
                        ListTileChildren(
                          initialValueForTheFilter: 200,
                          finalValueForTheFilter: 299.99,
                          text: '''View items with their prices ranging from
                        - \$200.00 to \$299.99''',
                        ),
                        ListTileChildren(
                          initialValueForTheFilter: 300,
                          finalValueForTheFilter: 399.99,
                          text: '''View items with their prices ranging from
                        - \$300.00 to \$399.99''',
                        ),
                        ListTileChildren(
                          initialValueForTheFilter: 400,
                          finalValueForTheFilter: 500,
                          text: '''View items with their prices ranging from
                        - above \$ 400''',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
