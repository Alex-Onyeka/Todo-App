import 'package:flutter/material.dart';

class TextFieldDetails extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const TextFieldDetails({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Edit Details',
      ),
    );
  }
}
