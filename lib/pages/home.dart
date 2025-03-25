import 'package:flutter/material.dart';
import 'package:todo/data/database.dart';
import 'package:todo/items/alert_dialog_create.dart';
import 'package:todo/items/alert_dialog_delete.dart';
import 'package:todo/items/todo_class.dart';
import 'package:todo/items/todo_tile.dart';
import 'package:todo/items/alert_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //
  //
  //
  //
  //

  //
  //
  //
  void check(value, index) {
    setState(() {
      db.todoList[index].isCompleted =
          !db.todoList[index].isCompleted;
    });
  }

  //
  //
  //
  void edit(index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialogg(
          controllerName: controllerName,
          controllerDetails: controllerDetails,
          todoClass: db.todoList[index],
          onPressedCancel: () {
            cancelEdit();
          },
          onPressedSave: () {
            saveEdit(index);
          },
        );
      },
    );
  }

  //
  //
  //
  //
  void delete(index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialogDelete(
          proceed: () {
            setState(() {
              db.todoList.removeAt(index);
            });
            Navigator.of(context).pop();
          },
          cancelCreate: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  //
  //
  //
  //
  void addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialogCreate(
          controllerDetailsCreate: controllerDetailsCreate,
          controllerNameCreate: controllerNameCreate,
          createTask: () {
            createNewTask(
              controllerDetailsCreate.text,
              controllerNameCreate.text,
            );
          },
          cancelCreate: cancelEdit,
        );
      },
    );
  }

  //
  //
  //
  void createNewTask(title, details) {
    setState(() {
      if (controllerNameCreate.text.isNotEmpty &&
          controllerDetailsCreate.text.isNotEmpty) {
        db.todoList.add(
          TodoClass(
            title: title,
            details: details,
            date: 'Mondays',
            isCompleted: false,
          ),
        );
        Navigator.pop(context);
      }
    });
  }

  //
  //
  //
  TextEditingController controllerName =
      TextEditingController();
  TextEditingController controllerDetails =
      TextEditingController();
  TextEditingController controllerNameCreate =
      TextEditingController();
  TextEditingController controllerDetailsCreate =
      TextEditingController();
  //
  //
  //
  //
  void saveEdit(index) {
    if (controllerName.text.isNotEmpty &&
        controllerDetails.text.isNotEmpty) {
      setState(() {
        db.todoList[index].title = controllerName.text;
        db.todoList[index].details = controllerDetails.text;
      });
    } else if (controllerDetails.text.isNotEmpty &&
        controllerName.text.isEmpty) {
      setState(() {
        db.todoList[index].details = controllerDetails.text;
      });
    } else if (controllerDetails.text.isEmpty &&
        controllerName.text.isNotEmpty) {
      setState(() {
        db.todoList[index].title = controllerName.text;
      });
    } else {}
    controllerDetails.clear();
    controllerName.clear();
    Navigator.pop(context);
  }

  //
  //
  //
  void cancelEdit() {
    Navigator.pop(context);
  }

  //
  //
  //
  //

  //
  //
  //
  Database db = Database();
  //
  //
  //

  //
  @override
  void initState() {
    super.initState();
    db.createInitialData();
  }

  //
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          'TO DO',
        ),
        actions: [
          PopupMenuButton<PopMenu>(
            position: PopupMenuPosition.under,
            color: Colors.white,
            // enableFeedback: true,
            iconColor: Colors.white,
            menuPadding: EdgeInsets.only(left: 20),
            onSelected: (value) {
              // print(PopMenu.logout);
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem<PopMenu>(
                  value: PopMenu.logout,
                  child: Text('Log Out'),
                ),
              ];
            },
          ),
        ],
      ),
      //
      //
      //
      body: ListView.builder(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 8,
        ),
        primary: true,
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            todoClass: db.todoList[index],
            onChanged: (value) {
              check(value, index);
            },
            edit: () {
              edit(index);
            },
            delete: () {
              delete(index);
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          right: 12,
          bottom: 12,
        ),
        child: FloatingActionButton(
          onPressed: addTask,
          child: Icon(color: Colors.white, Icons.add),
        ),
      ),
    );
  }
}

enum PopMenu { logout }
