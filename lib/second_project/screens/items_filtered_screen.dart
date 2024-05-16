import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/screens/details_screen.dart';
import 'package:building/second_project/state_managers/item_model.dart';
import 'package:building/second_project/widgets/gridview_builder.dart';
import 'package:building/second_project/widgets/if__empty_notice_card.dart';
import 'package:flutter/material.dart';

class ItemFiltered extends StatefulWidget {
  const ItemFiltered({super.key, required this.itemsToDisplay});

  final List<Item> itemsToDisplay;

  @override
  State<ItemFiltered> createState() => _ItemFilteredState();
}

class _ItemFilteredState extends State<ItemFiltered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: midColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            addToCartClicked = false;
            Navigator.pop(context);
          },
        ),
        backgroundColor: mainColor,
        title: const Text('Filter Screen'),
      ),
      body: widget.itemsToDisplay.isNotEmpty
          ? GridViewBuilder(
              itemThatWillBeDisplayed: widget.itemsToDisplay,
            )
          : const If_EmptyNoticeCard(
              navigateToHome: false,
              message: '''Seems there isn't any product
                    in this range.
        Let view all products!''',
            ),
    );
  }
}
