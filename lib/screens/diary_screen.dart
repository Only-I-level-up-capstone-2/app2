import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final TextEditingController _diaryController = TextEditingController();

  void _saveDiary() async {
    String diaryText = _diaryController.text.trim();
    if (diaryText.isNotEmpty) {
      await FirestoreService().saveDiary('user_id_placeholder', diaryText, DateTime.now(), '');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Diary saved!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _diaryController,
              decoration: InputDecoration(labelText: 'Write your diary here'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveDiary,
              child: Text('Save Diary'),
            ),
          ],
        ),
      ),
    );
  }
}
