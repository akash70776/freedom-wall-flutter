import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/freedom_wall/ui/home_tab.dart';

class FreedomWallApp extends StatelessWidget {
  const FreedomWallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeTabs(),
    );
  }
}
