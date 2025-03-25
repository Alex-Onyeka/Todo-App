//@HiveType(typeId: 1)
class TodoItem {
  //  @HiveField(0)
  String title;
  // @HiveField(1)
  String details;
  // @HiveField(2)
  final String date;
  // @HiveField(3, defaultValue: false)
  bool isCompleted;

  TodoItem({
    required this.date,
    required this.title,
    required this.details,
    required this.isCompleted,
  });
}
