import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';
import 'app_providers.dart';

class GigWiseApp extends ConsumerWidget {
  const GigWiseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appName = ref.watch(appNameProvider);

    return MaterialApp.router(
      title: appName,
      theme: AppTheme.light(),
      routerConfig: appRouter,
    );
  }
}