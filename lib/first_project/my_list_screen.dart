import 'package:building/first_project/providers/movie_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final mylist = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'My List (${mylist.length})',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        )),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: mylist.length,
        itemBuilder: (_, index) {
          final currentMovie = mylist[index];
          return Card(
            key: ValueKey(currentMovie.title),
            elevation: 4,
            child: ListTile(
              title: Text(currentMovie.title),
              subtitle: Text(currentMovie.duration ?? "No Information"),
              trailing: TextButton(
                child: Text(
                  'Remove',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  context.read<MovieProvider>().removeFromList(currentMovie);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
