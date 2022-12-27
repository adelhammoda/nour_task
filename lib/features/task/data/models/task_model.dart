import 'package:nour_task/features/task/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {


  TaskModel(
      {required super.id, required super.title, required super.description, required super.date, required super.imageUrl, required super.statues, required super.duration});


  factory TaskModel.fromJson(Map json){
    return TaskModel(
      id:json[TaskModelKeys.id],
      title:json[TaskModelKeys.title],
          description:json[TaskModelKeys.description],
     statues:json[TaskModelKeys.statues],
      duration:json[TaskModelKeys.duration],
     date:json[TaskModelKeys.date],
      imageUrl:json[TaskModelKeys.imageUrl],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      TaskModelKeys.id: id,
      TaskModelKeys.title: title,
      TaskModelKeys.description: description,
      TaskModelKeys.duration: duration,
      TaskModelKeys.statues: statues,
      TaskModelKeys.date: date.toIso8601String(),
      TaskModelKeys.imageUrl: imageUrl,
    };
  }


}


class TaskModelKeys{
  static const String task = "task";
  static const String id = 'id';
  static const String title = 'title';
  static const String description = 'description';
  static const String duration = 'duration';
  static const String statues = 'statues';
  static const String date = 'date';
  static const String imageUrl = 'image_url';
}