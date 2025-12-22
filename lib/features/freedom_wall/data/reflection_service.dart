import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/reflection.dart';

class ReflectionService {
  static const String _collection = 'reflections';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Create a new reflection (default: pending)
  Future<void> addReflection(ReflectionPost reflection) async {
    await _firestore.collection(_collection).doc(reflection.id).set({
      ...reflection.toJson(),
      'status': 'pending',
    });
  }

  /// Fetch approved reflections only (ONE-TIME)
  Future<List<ReflectionPost>> fetchApprovedReflections() async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('status', isEqualTo: 'approved')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      return ReflectionPost.fromJson(doc.data(), doc.id);
    }).toList();
  }

  /// 🔴 NEW: Real-time stream of approved reflections (for Feed later)
  Stream<List<ReflectionPost>> watchApprovedReflections() {
    return _firestore
        .collection(_collection)
        .where('status', isEqualTo: 'approved')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) =>
                  ReflectionPost.fromJson(doc.data(), doc.id))
              .toList();
        });
  }

  /// Admin only: Fetch pending reflections (ONE-TIME)
  Future<List<ReflectionPost>> fetchPendingReflections() async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('status', isEqualTo: 'pending')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      return ReflectionPost.fromJson(doc.data(), doc.id);
    }).toList();
  }

  /// 🔴 NEW: Real-time stream of pending reflections (ADMIN)
  Stream<List<ReflectionPost>> watchPendingReflections() {
    return _firestore
        .collection(_collection)
        .where('status', isEqualTo: 'pending')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) =>
                  ReflectionPost.fromJson(doc.data(), doc.id))
              .toList();
        });
  }

  /// Admin: Approve reflection
  Future<void> approveReflection(String id) async {
    await _firestore.collection(_collection).doc(id).update({
      'status': 'approved',
    });
  }

  /// Admin: Reject reflection
  Future<void> rejectReflection(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }
}
