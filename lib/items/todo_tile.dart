import 'package:flutter/material.dart';
import 'package:todo/items/todo_class.dart';

class TodoTile extends StatefulWidget {
  final VoidCallback edit;
  final VoidCallback delete;
  final Function(bool?)? onChanged;
  final TodoClass todoClass;
  const TodoTile({
    super.key,
    required this.todoClass,
    required this.onChanged,
    required this.edit,
    required this.delete,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color:
                widget.todoClass.isCompleted
                    ? const Color.fromARGB(20, 0, 0, 0)
                    : const Color.fromARGB(0, 0, 0, 0),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color:
                  widget.todoClass.isCompleted
                      ? const Color.fromARGB(0, 0, 0, 0)
                      : const Color.fromARGB(19, 0, 0, 0),
              offset: Offset(0, 4),
              spreadRadius: 2,
            ),
          ],
        ),
        //
        //
        //
        child: Row(
          children: [
            Checkbox(
              value: widget.todoClass.isCompleted,
              onChanged: widget.onChanged,
              activeColor: Colors.grey,
            ),
            Expanded(
              child: Text(
                style: TextStyle(
                  color:
                      widget.todoClass.isCompleted ? Colors.grey : Colors.teal,
                  fontSize: 16,
                  //fontWeight: FontWeight.bold,
                ),
                widget.todoClass.title,
              ),
            ),
            Visibility(
              visible: widget.todoClass.isCompleted ? false : true,
              child: IconButton(
                onPressed: widget.edit,
                icon: Icon(color: Colors.grey.shade400, Icons.edit),
              ),
            ),
            IconButton(
              onPressed: widget.delete,
              icon: Icon(
                color: Colors.grey.shade400,
                Icons.delete_outline_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
