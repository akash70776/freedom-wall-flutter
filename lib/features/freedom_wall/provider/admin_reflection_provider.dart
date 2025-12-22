import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/reflection.dart';
import 'reflection_provider.dart';

final adminPendingReflectionsProvider =
    StreamProvider<List<ReflectionPost>>((ref) {
  final service = ref.watch(reflectionServiceProvider);
  return service.watchPendingReflections();
});
