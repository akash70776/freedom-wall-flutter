import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/reflection_provider.dart';
import '../model/reflection.dart';
import 'admin_moderation_screen.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reflectionsState = ref.watch(approvedReflectionsProvider);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 12),
            GestureDetector(
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AdminModerationScreen(),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/elim_logo.png',
                height: 32,
              ),
            ),
            const SizedBox(width: 10),
            const Text('Freedom Wall'),
          ],
        ),
      ),
      body: reflectionsState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => const Center(
          child: Text('Something went wrong. Please try again.'),
        ),
        data: (List<ReflectionPost> reflections) {
          if (reflections.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  'No reflections yet.\n\nTake a moment to share what you received from the gathering.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 80),
            itemCount: reflections.length,
            itemBuilder: (context, index) {
              final reflection = reflections[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category
                      Text(
                        reflection.category.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(
                              color:
                                  Theme.of(context).colorScheme.primary,
                              letterSpacing: 1,
                            ),
                      ),

                      const SizedBox(height: 12),

                      // Message
                      Text(
                        reflection.message,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),

                      const SizedBox(height: 16),

                      // Footer
                      Text(
                        reflection.isAnonymous ? 'Anonymous' : 'Shared',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
