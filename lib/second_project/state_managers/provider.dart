import 'dart:collection';

import 'package:building/second_project/state_managers/item_model.dart';
import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _listOfItems = allItems;
  UnmodifiableListView get listOfItems => UnmodifiableListView(_listOfItems);
  int _currentPage = 0;
  int get currentPage => _currentPage;

  final List<Item> _listOfItemsInCart = [];
  List<Item> get listOfItemsInCart => _listOfItemsInCart;

  final List<Item> _favorites = [];
  List<Item> get favorites => _favorites;

  addToCart(Item item) {
    _listOfItemsInCart.add(item);

    notifyListeners();
  }

  removeFromCart(Item item) {
    _listOfItemsInCart.remove(item);
    notifyListeners();
  }

  addToFavorite(Item item) {
    _favorites.add(item);

    notifyListeners();
  }

  removeFromFavorite(Item item) {
    _favorites.remove(item);
    notifyListeners();
  }

  bottomNavBarItemOnTap(int index) {
    _currentPage = index;
    notifyListeners();
  }
}
