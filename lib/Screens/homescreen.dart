import 'package:flutter/material.dart';
import 'package:youtube_basic/Screens/searchingScreen.dart';
import 'package:youtube_basic/Screens/videoScreen.dart';
import 'package:youtube_basic/services/video_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final VideoService _videoService = VideoService();
  late Future<List<Video>> _videos;

  @override
  void initState() {
    super.initState();
    _videos = _videoService.fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Row(
                children: [
                  Container(
                    width: 40,
                    height: 30,
                    child: const Image(
                      image: AssetImage('assets/images/y_logo.png'),
                    ),
                  ),
                  const Text(
                    "YouTube",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.cast_sharp),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_sharp),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SearchScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFilterTabBar(),
              _buildVideoCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTabBar() {
    final categories = [
      "Gaming",
      "Flutter",
      "Laboratories",
      "Computer programming",
      "Physics",
      "News",
      "Viral videos",
      "Inventions",
      "Music"
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                category,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildVideoCard() {
    return FutureBuilder<List<Video>>(
      future: _videos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No videos found');
        }

        final videos = snapshot.data!;
        return ListView.builder(
          itemCount: videos.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final video = videos[index];
            return ListTile(
              title: Text(video.title),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => VideoScreen(video: video),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
