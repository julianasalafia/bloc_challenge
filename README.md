# Flutter BLoC Challenge: API-Powered Todo List

***Note: This challenge was created for educational and practice purposes. The goal is to strengthen your skills in the BLoC pattern and API integration within the Flutter environment.***

## Objective
Refactor a simple Todo List application to fetch and manage its data from the **JSONPlaceholder** API. This will challenge you to handle asynchronous operations, network states (loading, success, error), and data parsing within the BLoC pattern.

## API Endpoint
You will use the `/todos` endpoint from JSONPlaceholder:
- **GET:** `https://jsonplaceholder.typicode.com/todos` to fetch the list of todos.
- **POST:** `https://jsonplaceholder.typicode.com/todos` to add a new todo.
- **PUT/PATCH:** `https://jsonplaceholder.typicode.com/todos/<id>` to update a todo's status.

*Note: JSONPlaceholder will simulate the requests and return success responses, but it will not actually persist your changes on the server.*

## Core Requirements
1.  **Data Model:** Create a `Todo` model class in Dart that can be serialized and deserialized from the JSON structure provided by the API. It should include `id`, `userId`, `title`, and `completed` fields. Implement `fromJson` and `toJson` methods.

2.  **Fetch Todos on Load:** When the app starts, it should trigger an event to fetch the list of todos from the API and display them.

3.  **Handle Network States:** Your UI must react to different states from the BLoC:
    - Show a loading indicator (like a `CircularProgressIndicator`) while the todos are being fetched.
    - Display the list of todos once they are successfully loaded.
    - Show a user-friendly error message if the API call fails.

4.  **Add a Todo:** The "Add" functionality should now:
    - Optimistically update the UI by adding the new todo to the local state immediately.
    - Send a `POST` request to the API.
    - If the API call fails, revert the optimistic update and show an error.

5.  **Toggle Completion Status:** Tapping the checkbox should:
    - Optimistically update the UI by changing the todo's `completed` status.
    - Send a `PUT` or `PATCH` request to the API to update the todo.

## Technical Specifications
- **Framework:** Flutter
- **State Management:** `flutter_bloc`
- **HTTP Client:** Use a package like `http` or `dio` to make API requests.
- **BLoC Implementation:** Your BLoC will now be responsible for calling the API. It is good practice to have a "repository" or "service" class that handles the HTTP logic, which your BLoC will then communicate with.

## BLoC Structure Example
#### Events:
- `TodosFetched`: Initial event to load data.
- `TodoAdded`: Carries a new `Todo` object to be sent to the API.
- `TodoUpdated`: Carries the `Todo` that was toggled.

#### States:
- `TodosInitial`
- `TodosLoadInProgress`
- `TodosLoadSuccess`: Should contain the `List<Todo>` fetched from the API.
- `TodosLoadFailure`: Should contain an error message to display in the UI.

## Bonus Feature
Implement a **"pull-to-refresh"** mechanism on the list screen. When the user pulls down, the app should re-trigger the `TodosFetched` event to get the latest data from the API.

