import 'package:flutter/material.dart';
import 'package:todo/items/button.dart';

class AlertDialogDelete extends StatelessWidget {
  final VoidCallback proceed;
  final VoidCallback cancelCreate;
  const AlertDialogDelete({
    super.key,
    required this.proceed,
    required this.cancelCreate,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 30,
          ),
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    'Delete Task?',
                  ),
                ],
              ),
              Flexible(
                child: Text(
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  'Your deleted Todo Item can not be recorvered... Are you sure you want to proceed?',
                ),
              ),
              Row(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainButton(
                    onPressed: proceed,
                    isSave: true,
                  ),
                  MainButton(
                    onPressed: cancelCreate,
                    isSave: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
