

import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository{
  Either<Failure,Future<List<TaskEntity>>> getAllDailyTask();
}