import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';
import 'core/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = AppThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: themeData.lightTheme,
      darkTheme: themeData.darkTheme,
    );
  }
}
