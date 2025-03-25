import 'package:todo/items/todo_class.dart';

class Database {
  List todoList = [];

  // Create Initial Data
  void createInitialData() {
    todoList = [
      TodoClass(
        title: 'Morning Workout',
        details:
            'I want to spend the first 30 mins of every morning to workout.',
        date: 'Monday',
        isCompleted: false,
      ),
      TodoClass(
        title: 'Afternoon Reading',
        details:
            'I want to spend the my Noon, from 1pm to 3pm of every day to study Shakespare.',
        date: 'All Week',
        isCompleted: false,
      ),
    ];
  }

  // Create Initial Data
}
