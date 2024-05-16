import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/screens/cart_screens.dart';
import 'package:building/second_project/screens/category_screen.dart';
import 'package:building/second_project/screens/home_screen.dart';
import 'package:building/second_project/screens/profile.dart';
import 'package:building/second_project/screens/favorite_screen.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final List<Widget> screens = const [
    HomeView(),
    FavoriteScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];
 



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final myFavorites = context.watch<ItemProvider>().favoriteProducts;
    final int currentPage = context.watch<ItemProvider>().currentPage;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('Shopping App'),
        leading: const Icon(Icons.menu),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              child: const Icon(Icons.shopping_basket)),
          SizedBox(
            width: size.width * 0.04,
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mainColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index) =>
            context.read<ItemProvider>().bottomNavBarItemOnTap(index),
        currentIndex: currentPage,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: SizedBox(
                width: size.width * 0.08,
                child: Stack(
                  children: [
                    const Icon(
                      Icons.favorite,
                    ),
                    Positioned(
                      left: 15,
                      child: CircleAvatar(
                        backgroundColor: minorColor.withOpacity(0.8),
                        radius: size.width * 0.021,
                        child: Text(
                          textAlign: TextAlign.center,
                          myFavorites.length.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.019,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              label: 'Favorite'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
