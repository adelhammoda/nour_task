class TaskEntity{
  final String id;
  final String title;
  final String description;
  final TaskStatues statues;
  final Duration duration;
  final DateTime date;
  final String imageUrl;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.statues,
    required this.duration,
    required this.date,
    required this.imageUrl,
});




}




enum TaskStatues {
  done,pending
}