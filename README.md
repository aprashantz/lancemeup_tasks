# LanceMeUp Tasks

## Note: Uses Flutter Secure Storage package, so please change minSDKVersion to at least 18 to run task 2: CRUD

- Task 1: UI Clone
- Task 2: App with CRUD feature with API integration and State Management

### Rough Brain Storming on how i will carry out these tasks

- Will use BLOC state management.
- Will follow folder architecture of lib: (data, business_logic, presentation)
- Will try to make responsive UI using MediaQuery class to obtain device width/height and present widgets as per the resolution.
- data: to keep API, models and data stuffs in data directory
- business_logic: to keep state management, functionality logics
- presentation: to keep screens, widgets, assets
- other possible directories: constants, utils

Task 1:

- Will be using provided Figma references and develop it to Flutter UI
- Will consider the color hexcodes to implement it on app theme
  and make the app adapt dark or light theme as per user's system setting.

Task 2:

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
