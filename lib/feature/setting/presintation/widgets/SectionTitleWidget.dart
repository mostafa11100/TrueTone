import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  const SectionTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }
}
