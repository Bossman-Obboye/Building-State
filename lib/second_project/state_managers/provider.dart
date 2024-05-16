import 'dart:convert';
import 'dart:developer';

import 'package:building/second_project/components/mapper.dart';
import 'package:building/second_project/state_managers/item_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _listOfItems = allItems;
  List<Item> get listOfItems => _listOfItems;
  int _currentPage = 0;
  int get currentPage => _currentPage;

  final List<Item> _listOfItemsInCart = [];
  List<Item> get listOfItemsInCart => _listOfItemsInCart;

  final List<Item> _favorites = [];
  List<Item> get favorites => _favorites;

// Fetching data from API
  final String _apiUrl = 'https://api.escuelajs.co/api/v1/products';
  Dio dio = Dio();
  Future<List<Products>> getData() async {
    try {
      final Response response = await dio.get(_apiUrl);
      if (response.statusCode == 200) {
        // print('Response: ${response.data}');

        List<Products> products = productsFromJson(jsonEncode(response.data));
        return products;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  final List<Products> _favoriteProducts = [];
  List<Products> get favoriteProducts => _favoriteProducts;

  addToFavoriteProducts(Products product) {
    _favoriteProducts.add(product);
    notifyListeners();
  }

  removeFromFavoriteProducts(Products product) {
    _favoriteProducts.remove(product);
    notifyListeners();
  }

  // List<Item> funcToFilterProductsByPrice(double initialValue, double finalValue) {
  //   List<Item> filteredList = allItems
  //       .where((eachItem) =>
  //           eachItem.price >= initialValue && eachItem.price <= finalValue)
  //       .toList();
  //   return filteredList;
  // }

  // List<Item> funcToFilterProductsByName(double initialValue, double finalValue) {
  //   List<{Products}> filteredList = allProducts
  //       .where((eachItem) =>
  //           int.parse(eachItem.name.substring(5, eachItem.name.length)) >=
  //               initialValue &&
  //           int.parse(eachItem.name.substring(5, eachItem.name.length)) <=
  //               finalValue)
  //       .toList();
  //   return filteredList;
  // }
  Future<List<Products>> get allProducts => getData();

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

  List<Item> funcToFilterItemsByPrice(double initialValue, double finalValue) {
    List<Item> filteredList = allItems
        .where((eachItem) =>
            eachItem.price >= initialValue && eachItem.price <= finalValue)
        .toList();
    return filteredList;
  }

  List<Item> funcToFilterItemsByName(double initialValue, double finalValue) {
    List<Item> filteredList = allItems
        .where((eachItem) =>
            int.parse(eachItem.name.substring(5, eachItem.name.length)) >=
                initialValue &&
            int.parse(eachItem.name.substring(5, eachItem.name.length)) <=
                finalValue)
        .toList();
    return filteredList;
  }
}
