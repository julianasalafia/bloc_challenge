# Flutter BLoC Challenge: API-Powered Task List

***Note: This challenge was created for educational and practice purposes. The goal is to strengthen your skills in the BLoC pattern and API integration within the Flutter environment.***

## Objective
Refactor a simple Task List application to fetch and manage its data from the **JSONPlaceholder** API. This will challenge you to handle asynchronous operations, network states (loading, success, error), and data parsing within the BLoC pattern.

## API Endpoint
You will use the `/todos` endpoint from JSONPlaceholder:
- **GET:** `https://jsonplaceholder.typicode.com/todos` to fetch the list of tasks.
- **POST:** `https://jsonplaceholder.typicode.com/todos` to add a new task.
- **PUT/PATCH:** `https://jsonplaceholder.typicode.com/todos/<id>` to update a task's status.

*Note: JSONPlaceholder will simulate the requests and return success responses, but it will not actually persist your changes on the server.*

## Core Requirements
1.  **Data Model:** Create a `Task` model class in Dart that can be serialized and deserialized from the JSON structure provided by the API. It should include `id`, `userId`, `title`, and `completed` fields. Implement `fromJson` and `toJson` methods.

2.  **Fetch Tasks on Load:** When the app starts, it should trigger an event to fetch the list of tasks from the API and display them.

3.  **Handle Network States:** Your UI must react to different states from the BLoC:
    - Show a loading indicator (like a `CircularProgressIndicator`) while the tasks are being fetched.
    - Display the list of tasks once they are successfully loaded.
    - Show a user-friendly error message if the API call fails.

4.  **Add a Task:** The "Add" functionality should now:
    - Optimistically update the UI by adding the new task to the local state immediately.
    - Send a `POST` request to the API.
    - If the API call fails, revert the optimistic update and show an error.

5.  **Toggle Completion Status:** Tapping the checkbox should:
    - Optimistically update the UI by changing the task's `completed` status.
    - Send a `PUT` or `PATCH` request to the API to update the task.

## Technical Specifications
- **Framework:** Flutter
- **State Management:** `flutter_bloc`
- **HTTP Client:** Use a package like `http` or `dio` to make API requests.
- **BLoC Implementation:** Your BLoC will now be responsible for calling the API. It is good practice to have a "repository" or "service" class that handles the HTTP logic, which your BLoC will then communicate with.

## BLoC Structure Example
#### Events:
- `TasksFetched`: Initial event to load data.
- `TaskAdded`: Carries a new `Task` object to be sent to the API.
- `TaskCompletionToggled`: Carries the `Task` whose completion status was changed.

#### States:
- `TasksInitial`
- `TasksLoadInProgress`
- `TasksLoadSuccess`: Should contain the `List<Task>` fetched from the API.
- `TasksLoadFailure`: Should contain an error message to display in the UI.

## Bonus Feature
Implement a **"pull-to-refresh"** mechanism on the list screen. When the user pulls down, the app should re-trigger the `TasksFetched` event to get the latest data from the API.

