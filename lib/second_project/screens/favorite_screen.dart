import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:building/second_project/widgets/gridview_builder.dart';
import 'package:building/second_project/widgets/if__empty_notice_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myFavorites = context.watch<ItemProvider>().favorites;
    return Scaffold(
      backgroundColor: midColor,
      body: myFavorites.isNotEmpty
          ? GridViewBuilder(itemThatWillBeDisplayed: myFavorites)
          : const If_EmptyNoticeCard(),
    );
  }
}