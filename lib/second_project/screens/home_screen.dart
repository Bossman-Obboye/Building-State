import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/components/mapper.dart';
import 'package:building/second_project/screens/details_screen.dart';

import 'package:building/second_project/state_managers/provider.dart';
import 'package:building/second_project/widgets/if__empty_notice_card.dart';
import 'package:building/second_project/widgets/product_grid_view_builder.dart';
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
            : ProductGridViewBuilder(products: products));
  }
}


