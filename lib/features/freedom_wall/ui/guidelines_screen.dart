import 'package:flutter/material.dart';

class GuidelinesScreen extends StatelessWidget {
  const GuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guidelines'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            Text(
              'Freedom Wall Guidelines',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '• Share respectfully and truthfully.\n'
              '• Keep reflections aligned with our faith and values.\n'
              '• Avoid naming individuals or sensitive details.\n'
              '• Posts are reviewed before appearing publicly.\n'
              '• Use this space to encourage and build up the community.',
              style: TextStyle(height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
