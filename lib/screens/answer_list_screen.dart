import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class AnswerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: FirestoreService().getUserAnswers('user_id_placeholder'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading answers'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No answers found'));
        } else {
          final answers = snapshot.data!;
          return ListView.builder(
            itemCount: answers.length,
            itemBuilder: (context, index) {
              final answer = answers[index];
              return ListTile(
                title: Text(answer['answer']),
                subtitle: Text(answer['date'].toString()),
              );
            },
          );
        }
      },
    );
  }
}
