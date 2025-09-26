import 'package:bloc_challenge/bloc/task_bloc.dart';
import 'package:bloc_challenge/bloc/task_event.dart';
import 'package:bloc_challenge/bloc/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late final TaskBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = TaskBloc();
    bloc.add(TasksFetchedEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: BlocBuilder<TaskBloc, TaskState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is TasksInitialState || state is TasksLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TasksLoadSuccessState) {
              final taskList = state.taskList;

              return ListView.separated(
                separatorBuilder: (_, __) => SizedBox(height: 12),
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Text(taskList[index].id.toString()),
                        Text(
                          taskList[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
