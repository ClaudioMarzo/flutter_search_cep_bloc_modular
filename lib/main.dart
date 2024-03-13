import 'package:bloc_test/app_modular.dart';
import 'package:bloc_test/feacture/seach_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModular(),
      child: const SeachWidget(),
    ),
  );
}
