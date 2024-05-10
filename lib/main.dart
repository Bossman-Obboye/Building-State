import 'package:building/first_project_redesigned/home_screen.dart';
import 'package:building/first_project_redesigned/index.dart';
import 'package:building/first_project_redesigned/source/videos_source.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<VideosSource>(
      create: (_) {
        return VideosSource();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IndexScreen(),
      ),
    ),
  );
}
