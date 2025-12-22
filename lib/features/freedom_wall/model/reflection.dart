import 'package:cloud_firestore/cloud_firestore.dart';

class ReflectionPost {
  final String id;
  final String message;
  final String category;
  final bool isAnonymous;
  final DateTime createdAt;

  ReflectionPost({
    required this.id,
    required this.message,
    required this.category,
    required this.isAnonymous,
    required this.createdAt,
  });

  /// Convert Firestore / JSON → Model
  factory ReflectionPost.fromJson(Map<String, dynamic> json, String id) {
    return ReflectionPost(
      id: id,
      message: json['message'] as String,
      category: json['category'] as String,
      isAnonymous: json['isAnonymous'] as bool,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  /// Convert Model → JSON (for storage)
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'category': category,
      'isAnonymous': isAnonymous,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
