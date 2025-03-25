import 'package:flutter/material.dart';
import 'package:todo/items/button.dart';
import 'package:todo/items/text_field_details.dart';
import 'package:todo/items/text_field_name.dart';

class AlertDialogCreate extends StatelessWidget {
  final TextEditingController controllerNameCreate;
  final TextEditingController controllerDetailsCreate;
  final VoidCallback createTask;
  final VoidCallback cancelCreate;
  const AlertDialogCreate({
    super.key,
    required this.controllerDetailsCreate,
    required this.controllerNameCreate,
    required this.createTask,
    required this.cancelCreate,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 300,
        width: 350,
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              'Create New Task',
            ),
            TextFieldName(
              hint: 'Enter Title',
              controller: controllerNameCreate,
            ),
            TextFieldDetails(
              hint: 'Enter Details',
              controller: controllerDetailsCreate,
            ),
            Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainButton(onPressed: createTask, isSave: true),
                MainButton(onPressed: cancelCreate, isSave: false),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
