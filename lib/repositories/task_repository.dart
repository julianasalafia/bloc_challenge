import 'dart:developer';

import 'package:bloc_challenge/models/task.dart';
import 'package:dio/dio.dart';

abstract class TaskRepositoryInterface {
  Future<List<Task>> fetchTasks();
}

class TaskRepository implements TaskRepositoryInterface {
  final Dio _dio;

  TaskRepository(this._dio);

  @override
  Future<List<Task>> fetchTasks() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/todos',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        return data.map((json) => Task.fromJson(json)).toList();
      } else {
        throw Exception('Error fetching tasks.');
      }
    } on DioException catch (error) {
      log('Dio Exception: $error');
      throw Exception;
    } catch (error) {
      log('Error: $error');
      throw Exception;
    }
  }
}
