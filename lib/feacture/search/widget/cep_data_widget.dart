import 'package:flutter/material.dart';

class CepDataWidget extends StatelessWidget {
  final Map<dynamic, dynamic> data;
  const CepDataWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: data.entries.map((entry) {
        return Text('${entry.key}: ${entry.value}');
      }).toList(),
    );
  }
}
