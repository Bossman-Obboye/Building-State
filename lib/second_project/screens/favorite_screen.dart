import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:building/second_project/widgets/if__empty_notice_card.dart';
import 'package:building/second_project/widgets/product_grid_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myFavorites = context.watch<ItemProvider>().favoriteProducts;
    return Scaffold(
      backgroundColor: midColor,
      body: myFavorites.isNotEmpty
          ? ProductGridViewBuilder(
              products: myFavorites,
            )
          : const If_EmptyNoticeCard(),
    );
  }
}
