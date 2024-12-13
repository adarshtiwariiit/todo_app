#Todo App
A Flutter application to manage your notes efficiently. This app uses modern state management and persistence techniques to provide a seamless user experience.

Table of Contents
Features
Getting Started
Setup Instructions
Technologies Used
State Management and Persistence
Usage
Features
Add Notes: Create notes effortlessly.
Delete Notes: Swipe to delete notes with Flutter Slidable.
Offline Persistence: Save notes locally using Hive, ensuring they are accessible even without an internet connection.
Clean Architecture: Structured to enhance maintainability and scalability.
Getting Started
Follow these instructions to set up and run the project locally.

Setup Instructions
Clone the repository:

bash
Copy code
git clone https://github.com/your-username/todo_app.git
cd todo_app
Install dependencies:

bash
Copy code
flutter pub get
Run the app:

bash
Copy code
flutter run
Note: Ensure you have a connected device or emulator configured.

Test the app:

Use the "+" button to add a new note.
Swipe left or right on a note to delete it.
Technologies Used
Flutter: The UI framework for building cross-platform apps.
GetX: For state management and dependency injection.
Hive: For local data storage and offline persistence.
Flutter Slidable: For implementing swipe-to-delete functionality.
State Management and Persistence
State Management
This project uses GetX for state management, providing:

Reactive Programming: The UI updates automatically when the state changes.
Controller: Each feature has its dedicated controller, keeping the logic clean and organized.
Dependency Injection: Ensures efficient memory usage and performance.
Persistence
Hive: A lightweight and fast NoSQL database is used to store notes locally. Hive ensures data remains available even after the app is closed or restarted.
Folder Structure
The project follows a clean architecture:

lib/pages: Contains feature-specific pages.
binding.dart: Handles dependency injection for the page.
controller.dart: Manages the business logic.
view.dart: The UI implementation.
lib/models: Defines data models used in the app.
lib/services: Handles data persistence and communication with Hive.
