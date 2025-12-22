import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freedom_wall/features/freedom_wall/provider/reflection_provider.dart';

import '../provider/admin_auth_provider.dart';
import '../provider/admin_reflection_provider.dart';

import 'admin_login_screen.dart';

class AdminModerationScreen extends ConsumerWidget {
  const AdminModerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(adminAuthStateProvider);

    return authState.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, _) => const Scaffold(
        body: Center(child: Text('Authentication error')),
      ),
      data: (user) {
        // 🔐 Not logged in → show admin login
        if (user == null) {
          return const AdminLoginScreen();
        }

        // 🔐 Logged in → check admin role
        return ref.watch(isAdminProvider).when(
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          error: (_, _) => const Scaffold(
            body: Center(child: Text('Failed to verify admin access')),
          ),
          data: (isAdmin) {
            if (!isAdmin) {
              return const Scaffold(
                body: Center(child: Text('Access denied')),
              );
            }

            // ✅ Logged in AND admin
            return const _AdminModerationBody();
          },
        );
      },
    );
  }
}

class _AdminModerationBody extends ConsumerWidget {
  const _AdminModerationBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminPendingReflectionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Reflections'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(firebaseAuthProvider).signOut();
            },
          ),
        ],
      ),
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (_, _) => const Center(
          child: Text('Failed to load pending reflections'),
        ),
        data: (reflections) {
          if (reflections.isEmpty) {
            return const Center(
              child: Text('No pending reflections'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
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
                      Text(
                        reflection.category,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        reflection.message,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(reflectionServiceProvider)
                                  .rejectReflection(reflection.id);
                            },
                            child: const Text('Reject'),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(reflectionServiceProvider)
                                  .approveReflection(reflection.id);
                            },
                            child: const Text('Approve'),
                          ),
                        ],
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
