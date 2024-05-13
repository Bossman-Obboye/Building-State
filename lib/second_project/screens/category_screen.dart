import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: midColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          ListTile(
            leading: const Icon(Icons.favorite, color: callToAction),
            title: const Text("Name"),
            subtitle: const Text('Sort by \'Names\''),
            trailing: const Icon(Icons.arrow_forward_ios),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            visualDensity: VisualDensity.comfortable,
            onTap: () => context.read<ItemProvider>().bottomNavBarItemOnTap(1),
          ),
          SizedBox(
            height: returnSize(context).height * 0.02,
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            leading: const ImageIcon(
              AssetImage('lib/second_project/my_assets/coin.png'),
            ),
            title: const Text("Favorites"),
            subtitle: const Text('Sort by \'Favorite\''),
            visualDensity: VisualDensity.comfortable,
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => BottomSheet(
                onClosing: () {},
                backgroundColor: mainColor,
                builder: (context) => Container(
                  padding: EdgeInsets.only(
                    left: returnSize(context).height * 0.02,
                    right: returnSize(context).height * 0.02,
                    top: returnSize(context).height * 0.02,
                  ),
                  child: const Column(
                    children: [
                      ListTileChildren(
                        text: '''View items with the names ranging from
                      - Item 1 to Item 100''',
                      ),
                      ListTileChildren(
                        text: '''View items with the names ranging from
                      - Item 101 to Item 200''',
                      ),
                      ListTileChildren(
                        text: '''View items with the names ranging from
                      - Item 201 to Item 300''',
                      ),
                      ListTileChildren(
                        text: '''View items with the names ranging from
                      - Item 301 to Item 400''',
                      ),
                      ListTileChildren(
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
            height: returnSize(context).height * 0.02,
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            leading: const ImageIcon(
              AssetImage('lib/second_project/my_assets/coin.png'),
            ),
            title: const Text("Favorites"),
            subtitle: const Text('Sort by \'Favorite\''),
            visualDensity: VisualDensity.comfortable,
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => BottomSheet(
                onClosing: () {},
                backgroundColor: mainColor,
                builder: (context) => Container(
                  padding: EdgeInsets.only(
                    left: returnSize(context).height * 0.02,
                    right: returnSize(context).height * 0.02,
                    top: returnSize(context).height * 0.02,
                  ),
                  child: const Column(
                    children: [
                      ListTileChildren(),
                      ListTileChildren(
                        text: '''View items with their prices ranging from
                      - \$100.00 to \$199.99''',
                      ),
                      ListTileChildren(
                        text: '''View items with their prices ranging from
                      - \$200.00 to \$299.99''',
                      ),
                      ListTileChildren(
                        text: '''View items with their prices ranging from
                      - \$300.00 to \$399.99''',
                      ),
                      ListTileChildren(
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
    );
  }
}

class ListTileChildren extends StatelessWidget {
  const ListTileChildren({
    super.key,
    this.text = '''View items with their prices ranging from 
                      - \$0.00 to \$99.99''',
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: returnSize(context).height * 0.01,
      ),
      child: ListTile(
        tileColor: white,
        title: Text(text),
        titleTextStyle: const TextStyle(fontSize: 14, color: minorColor),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(width: 1),
        ),
        visualDensity: VisualDensity.comfortable,
        onTap: () {},
      ),
    );
  }
}
