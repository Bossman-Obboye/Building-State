import 'package:building/first_project_redesigned/source/videos_source.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    List<Video> videos = context.watch<VideosSource>().videos;
    List<Video> myFavorites = context.watch<VideosSource>().myfavorites;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            final currentVideo = videos[index];
      
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Card(
                  color: Colors.green[400],
                  child: ListTile(
                    title: Text(
                      currentVideo.title,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      currentVideo.duration ?? '**:**',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        if (!myFavorites.contains(currentVideo)) {
                          context
                              .read<VideosSource>()
                              .addVideo(currentVideo);
                        } else {
                          context
                              .read<VideosSource>()
                              .removeVideo(currentVideo);
                        }
                      },
                      child: Icon(Icons.favorite,
                          color: myFavorites.contains(currentVideo) ? Colors.red[300] : Colors.white, size: 25),
                    ),
                  ),
                ));
          }),
    );
  }
}
