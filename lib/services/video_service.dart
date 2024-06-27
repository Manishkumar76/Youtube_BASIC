import 'package:supabase_flutter/supabase_flutter.dart';

class Video {
  final String id;
  final String title;
  final String url;

  Video({required this.id, required this.title, required this.url});
}

class VideoService {
  final _supabase = Supabase.instance.client;

  Future<List<Video>> fetchVideos() async {
    final response = await _supabase
        .from('videos')
        .select('*').order('title', ascending: true);

    print(response);
    final List<dynamic> data = response;
    return data.map((e) => Video(
      id: e['id'] as String,
      title: e['title'] as String,
      url: e['url'] as String,
    )).toList();
  }

  Future<void> insertVideo(String title, String url) async {
    final response = await _supabase.from('videos').insert({
      'title': title,
      'url': url,
    });

    if (response.error != null) {
      print('Error inserting data: ${response.error!.message}');
    } else {
      print('Data inserted successfully');
    }
  }
}
