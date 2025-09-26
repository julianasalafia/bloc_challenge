abstract class TaskEvent {}

class TasksFetchedEvent implements TaskEvent {}

class TaskAddedEvent implements TaskEvent {}

class TaskCompletionToggledEvent implements TaskEvent {}
