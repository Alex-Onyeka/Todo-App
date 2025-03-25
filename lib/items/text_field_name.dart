import 'package:flutter/material.dart';

class TextFieldName extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const TextFieldName({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Edit Name',
      ),
    );
  }
}
