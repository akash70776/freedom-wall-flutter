import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/reflection_service.dart';
import '../model/reflection.dart';

final reflectionServiceProvider = Provider<ReflectionService>((ref) {
  return ReflectionService();
});

final approvedReflectionsProvider =
    StreamProvider<List<ReflectionPost>>((ref) {
  final service = ref.watch(reflectionServiceProvider);
  return service.watchApprovedReflections();
});
