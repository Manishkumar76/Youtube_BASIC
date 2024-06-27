import 'package:flutter/material.dart';
import 'package:youtube_basic/services/video_service.dart';

class AddVideoScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _urlController,
              decoration: InputDecoration(labelText: 'URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final title = _titleController.text;
                final url = _urlController.text;

                if (title.isNotEmpty && url.isNotEmpty) {
                  await VideoService().insertVideo(title, url);
                  // Clear the text fields after insertion
                  _titleController.clear();
                  _urlController.clear();
                } else {
                  print('Title and URL cannot be empty');
                }
              },
              child: Text('Insert Video'),
            ),
          ],
        ),
      ),
    );
  }
}


