class DiaryModel {
  final String userId;
  final String diary;
  final DateTime date;
  final String photoUrl;

  DiaryModel({
    required this.userId,
    required this.diary,
    required this.date,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'diary': diary,
      'date': date,
      'photoUrl': photoUrl,
    };
  }
}
