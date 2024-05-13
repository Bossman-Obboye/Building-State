import 'dart:math';

import 'package:flutter/material.dart';

// this is the model for each video
class Video {
  String title;
  String? duration;
  String? description;

  Video({required this.title, this.duration, this.description});
}

final List<String> _descriptions = [
  'a thrilling adventure!',
  'an action-packed movie!',
  'a heartwarming story!',
  'a suspenseful drama!',
  'an epic journey!',
  'a hilarious comedy!',
  'a captivating tale!',
  'an emotional rollercoaster!',
];

// this is the list of videos generated

final List<Video> _listOfVideos = List.generate(
  50,
  (index) => Video(
      title: 'Movie ${index+1}',
      duration: '${Random().nextInt(100) + 60} mins',
      description:
        'Movie ${index + 1} is ${_descriptions[Random().nextInt(_descriptions.length)]}'),
);

class VideosSource with ChangeNotifier {
  final List<Video> _videos = _listOfVideos;
  final List<Video> _favorite = [];

  List<Video> get videos => _videos;
  List<Video> get myfavorites => _favorite;

  addVideo(Video currentVideo) {
    _favorite.add(currentVideo);
    notifyListeners();
  }

  removeVideo(Video currentVideo) {
    _favorite.remove(currentVideo);
    notifyListeners();
  }
}
