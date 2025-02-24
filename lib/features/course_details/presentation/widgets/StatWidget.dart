import 'package:flutter/material.dart';

class StatWidget extends StatelessWidget {
  String? value;
  String? label;

  StatWidget({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value!,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(label!),
      ],
    );
  }
}
