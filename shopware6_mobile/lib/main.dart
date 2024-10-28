import 'package:flutter/material.dart';

import 'app.dart';
import 'core/main_bloc_provider.dart';
import 'core/main_repository_provider.dart';

void main() {
  runApp(MainRepositoryProvider(
      builder: (context) => const MainBlocProvider(child: App())));
}
