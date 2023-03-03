# lancemeup task 2: Demonstrate API integration and State Management

- As the task mentions to use movies related public API, will follow as it is.
- Will perform CRUD on those public APIS, and implement interfaces for it.
- If I wont find any public APIS that allows POST, DELETE request, will contact task supervisor.

Task 2 Brainstorming:

- Will use flutter secure storage to store access token of user
- If access token is present, user will be taken to home page after opening app
- If access token is not present, user will be taken to login page
- BLOC will be used to perform above logic.
- As this task is to check state management and API integration ability, I will allow myself to not care much on designs.
- Will keep four interfaces to do CRUD task.
- Will use BLOC Builder on each interfaces and handle UI as per the user interaction (state/event) triggering on what and when to show.
