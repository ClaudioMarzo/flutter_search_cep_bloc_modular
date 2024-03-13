import 'package:bloc_test/core/ui/theme/theme_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SeachWidget extends StatelessWidget {
  const SeachWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Search Cep',
      theme: ThemeConfig.theme,
      routerConfig: Modular.routerConfig,
    );
  }
}
