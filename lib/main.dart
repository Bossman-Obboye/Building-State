// import 'package:building/first_project_redesigned/home_screen.dart';
// import 'package:building/first_project_redesigned/index.dart';
// import 'package:building/first_project_redesigned/source/videos_source.dart';
import 'package:building/second_project/screens/index.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

void main() {
  runApp(

    ChangeNotifierProvider(
      create: (_) => ItemProvider(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: IndexScreen(),
        ),
    ),);
  //   ChangeNotifierProvider<VideosSource>(
  //     create: (_) {
  //       return VideosSource();
  //     },
  //     child: const MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: IndexScreen(),
  //     ),
  //   ),
  // );
}
