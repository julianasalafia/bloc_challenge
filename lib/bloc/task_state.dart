// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_challenge/models/task.dart';

abstract class TaskState {
  List<Task> taskList;

  TaskState({this.taskList = const []});
}

class TasksInitialState extends TaskState {}

class TasksLoadingState extends TaskState {
  TasksLoadingState({super.taskList});
}

class TasksLoadSuccessState extends TaskState {
  TasksLoadSuccessState({required super.taskList});
}

class TasksLoadFailureState extends TaskState {
  TasksLoadFailureState({super.taskList});
}
