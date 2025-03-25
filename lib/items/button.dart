import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isSave;
  const MainButton({
    super.key,
    required this.onPressed,
    required this.isSave,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(
            Size(100, 50),
          ),
          elevation: WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(
            isSave ? Colors.teal : Colors.white,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 15,
            ),
          ),
          side: WidgetStatePropertyAll(
            BorderSide(
              color:
                  isSave ? Colors.transparent : Colors.teal,
              width: 1,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          style: TextStyle(
            color: isSave ? Colors.white : Colors.teal,
            fontWeight: FontWeight.bold,
          ),
          isSave ? 'Proceed' : 'Cancel',
        ),
      ),
    );
  }
}
