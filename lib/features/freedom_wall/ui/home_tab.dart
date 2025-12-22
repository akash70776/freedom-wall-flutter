import 'package:flutter/material.dart';
import 'feed_screen.dart';
import 'submit_screen.dart';
import 'guidelines_screen.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    FeedScreen(),
    SubmitScreen(),
    GuidelinesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Share',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Guidelines',
          ),
        ],
      ),
    );
  }
}
