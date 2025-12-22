import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../model/reflection.dart';
import '../provider/reflection_provider.dart';

class SubmitScreen extends ConsumerStatefulWidget {
  const SubmitScreen({super.key});

  @override
  ConsumerState<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends ConsumerState<SubmitScreen> {
  final TextEditingController _messageController = TextEditingController();

  String _selectedCategory = 'Teaching';
  bool _isAnonymous = true;

  final List<String> _categories = [
    'Teaching',
    'Worship',
    'Healing',
    'Encouragement',
    'Breakthrough',
  ];

  Future<void> _handleSubmit() async {
    if (_messageController.text.trim().isEmpty) return;

    final reflection = ReflectionPost(
      id: const Uuid().v4(),
      message: _messageController.text.trim(),
      category: _selectedCategory,
      isAnonymous: _isAnonymous,
      createdAt: DateTime.now(),
    );

    await ref
        .read(reflectionServiceProvider)
        .addReflection(reflection);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Thank you for sharing. Your reflection will appear after review.',
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 12),
            Image.asset(
              'assets/images/elim_logo.png',
              height: 28,
            ),
            const SizedBox(width: 10),
            const Text('Share Reflection'),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Take a moment to reflect on what you received during the gathering.',
          ),

          const SizedBox(height: 24),

          // Reflection input
          TextField(
            controller: _messageController,
            maxLines: 6,
            decoration: const InputDecoration(
              hintText: 'Write your reflection here…',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 24),

          // Category
          const Text(
            'Category',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),

          DropdownButtonFormField<String>(
            initialValue: _selectedCategory,
            items: _categories
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          // Anonymous toggle
          SwitchListTile(
            title: const Text('Post anonymously'),
            subtitle: const Text('Your name will not be shown'),
            value: _isAnonymous,
            onChanged: (value) {
              setState(() {
                _isAnonymous = value;
              });
            },
          ),

          const SizedBox(height: 36),

          // Submit button
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: _handleSubmit,
              child: const Text('Submit Reflection'),
            ),
          ),
        ],
      ),
    );
  }
}
