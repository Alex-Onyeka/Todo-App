import 'package:flutter/material.dart';
import 'package:todo/items/button.dart';
import 'package:todo/items/text_field_details.dart';
import 'package:todo/items/text_field_name.dart';
import 'package:todo/items/todo_class.dart';

class AlertDialogg extends StatelessWidget {
  final TodoClass todoClass;
  final TextEditingController controllerName;
  final TextEditingController controllerDetails;
  final VoidCallback onPressedSave;
  final VoidCallback onPressedCancel;
  const AlertDialogg({
    super.key,
    required this.todoClass,
    required this.controllerName,
    required this.controllerDetails,
    required this.onPressedSave,
    required this.onPressedCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 300,
        width: 350,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
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
                  'Edit Task',
                ),
                TextFieldName(hint: 'Edit Title', controller: controllerName),
                TextFieldDetails(
                  hint: 'Edit Details',
                  controller: controllerDetails,
                ),
                Row(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainButton(onPressed: onPressedSave, isSave: true),
                    MainButton(onPressed: onPressedCancel, isSave: false),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
