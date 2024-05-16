import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/screens/items_filtered_screen.dart';
import 'package:building/second_project/state_managers/item_model.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTileChildren extends StatelessWidget {
  const ListTileChildren({
    super.key,
    required this.text,
    required this.finalValueForTheFilter,
    required this.initialValueForTheFilter,
    this.isForPrice = true,
  });
  final String text;
  final double initialValueForTheFilter;
  final double finalValueForTheFilter;
  final bool isForPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: size(context).height * 0.01,
      ),
      child: Card(
        elevation: 4,
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
          onTap: () {
            Navigator.pop(context);
            final List<Item> itemsToDisplay;
            if (isForPrice) {
              itemsToDisplay = context
                  .read<ItemProvider>()
                  .funcToFilterItemsByPrice(
                      initialValueForTheFilter, finalValueForTheFilter);
              // print(itemsToDisplay[1].toString());
            } else {
              itemsToDisplay = context
                  .read<ItemProvider>()
                  .funcToFilterItemsByName(
                      initialValueForTheFilter, finalValueForTheFilter);
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemFiltered(
                  itemsToDisplay: itemsToDisplay,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
