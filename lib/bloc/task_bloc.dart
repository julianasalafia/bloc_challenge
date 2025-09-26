import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_challenge/bloc/task_event.dart';
import 'package:bloc_challenge/bloc/task_state.dart';
import 'package:bloc_challenge/repositories/task_repository.dart';
import 'package:dio/dio.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _repository;

  TaskBloc() : _repository = TaskRepository(Dio()), super(TasksInitialState()) {
    on<TasksFetchedEvent>(_onTasksFetched);
    on<TaskAddedEvent>(_onTasksAdded);
    on<TaskCompletionToggledEvent>(_onTaskCompletionToggle);
  }

  FutureOr<void> _onTasksFetched(
    TasksFetchedEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      emit(TasksLoadingState());
      final tasks = await _repository.fetchTasks();
      emit(TasksLoadSuccessState(taskList: tasks));
    } catch (_) {
      emit(TasksLoadFailureState(taskList: state.taskList));
    }
  }

  FutureOr<void> _onTasksAdded(TaskAddedEvent event, Emitter<TaskState> emit) {}

  FutureOr<void> _onTaskCompletionToggle(
    TaskCompletionToggledEvent event,
    Emitter<TaskState> emit,
  ) {}
}
