import 'package:building/first_project_redesigned/source/videos_source.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<dynamic> myfavorites = context.watch<VideosSource>().myfavorites;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            Container(
              height: size.height * 0.08,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.red[300] ?? Colors.red,
                Colors.green[400] ?? Colors.green,
              ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "My List of Preference",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Icon(Icons.favorite, size: 30, color: Colors.red[300])
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final currentVideo = myfavorites[index];
                    return (ListTile(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2,
                            color: Colors.red[300] ?? Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      title: Text(
                        currentVideo.title,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(currentVideo.duration ?? '**:**'),
                          Text(
                            currentVideo.description ?? 'No Information',
                            style: TextStyle(
                                color: Colors.green[400],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      trailing: InkWell(
                        onTap: () => context.read<VideosSource>().removeVideo(currentVideo),
                        child: const Text("Remove",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.normal)),
                      ),
                    ));
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: size.height * 0.01,
                      ),
                  itemCount: myfavorites.length),
            ),
          ],
        ),
      ),
    );
  }
}
