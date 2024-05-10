import 'dart:math';

import 'package:building/first_project/providers/movie_model.dart';
import 'package:flutter/material.dart';

final List<Movie> initialData = List.generate(50, (index) {
  return Movie(
    title: "Movie $index",
    duration: "${Random().nextInt(100) + 60} minutes",
  );
});

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = initialData;
  final List<Movie> _myList = [];

  List<Movie> get movies => _movies;
  List<Movie> get myList => _myList;

  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
