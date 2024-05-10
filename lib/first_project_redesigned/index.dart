import 'package:building/first_project_redesigned/favorite_screen.dart';
import 'package:building/first_project_redesigned/home_screen.dart';
import 'package:building/first_project_redesigned/source/videos_source.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int currentIndex = 0;

  bool isSelected = false;

  onTap(index) {
    setState(() {
      currentIndex = index;
      isSelected = true;
    });
  }

  final List<Widget> pages = const [
    WelcomeScreen(),
    FavoriteScreen(),
    // BookView(),
    // ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    List<Video> myFavorites = context.watch<VideosSource>().myfavorites;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          size: size.width * 0.08,
          color: Colors.white,
        ),
        title: const Text('M. State',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          SizedBox(
            width: size.width * 0.08,
            child: InkWell(
              onTap: () => {
                setState(() {
                  currentIndex = 1;
                })
              },
              child: Stack(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: size.width * 0.07,
                  ),
                  Positioned(
                    left: 15,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.8),
                      radius: size.width * 0.019,
                      child: Text(
                        textAlign: TextAlign.center,
                        myFavorites.length.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.018,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.025,
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: 'Videos'),
          BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: size.width * 0.07,
                  ),
                  Positioned(
                    left: 15,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.8),
                      radius: size.width * 0.019,
                      child: Text(
                        textAlign: TextAlign.center,
                        myFavorites.length.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.018,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              label: 'Liked'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.menu_book), label: 'Post'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
