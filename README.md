<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <h1>Todo App</h1>
    <p>A Flutter application to manage your notes efficiently. This app uses modern state management and persistence techniques to provide a seamless user experience.</p>
    <hr>
    <h2 id="features">Features</h2>
  <img src="path/to/image.jpg" alt="Home screen" width="500" height="300">
    <ul>
        <li><strong>Add Notes:</strong> Create notes effortlessly.</li>
        <li><strong>Delete Notes:</strong> Swipe to delete notes with Flutter Slidable.</li>
        <li><strong>Offline Persistence:</strong> Save notes locally using Hive, ensuring they are accessible even without an internet connection.</li>
        <li><strong>Clean Architecture:</strong> Structured to enhance maintainability and scalability.</li>
    </ul>
    <hr>
    <h2 id="getting-started">Getting Started</h2>
    <p>Follow these instructions to set up and run the project locally.</p>
    <hr>
    <h2 id="setup-instructions">Setup Instructions</h2>
    <ol>
        <li>Clone the repository:
            <pre><code>git clone https://github.com/adarshtiwariiit/todo_app.git
cd todo_app
            </code></pre>
        </li>
        <li>Install dependencies:
            <pre><code>flutter pub get</code></pre>
        </li>
        <li>Run the app:
            <pre><code>flutter run</code></pre>
            <p><strong>Note:</strong> Ensure you have a connected device or emulator configured.</p>
        </li>
        <li>Test the app:
            <ul>
                <li>Use the "+" button to add a new note.</li>
                <li>Swipe left or right on a note to delete it.</li>
            </ul>
        </li>
    </ol>
    <hr>
    <h2 id="technologies-used">Technologies Used</h2>
    <ul>
        <li><strong>Flutter:</strong> The UI framework for building cross-platform apps.</li>
        <li><strong>GetX:</strong> For state management and dependency injection.</li>
        <li><strong>Hive:</strong> For local data storage and offline persistence.</li>
        <li><strong>Flutter Slidable:</strong> For implementing swipe-to-delete functionality.</li>
    </ul>
    <hr>
    <h2 id="state-management-and-persistence">State Management and Persistence</h2>
    <h3>State Management</h3>
    <p>This project uses <strong>GetX</strong> for state management, providing:</p>
    <ul>
        <li><strong>Reactive Programming:</strong> The UI updates automatically when the state changes.</li>
        <li><strong>Controller:</strong> Each feature has its dedicated controller, keeping the logic clean and organized.</li>
        <li><strong>Dependency Injection:</strong> Ensures efficient memory usage and performance.</li>
    </ul>
    <h3>Persistence</h3>
    <p><strong>Hive:</strong> A lightweight and fast NoSQL database is used to store notes locally. Hive ensures data remains available even after the app is closed or restarted.</p>
    <h3>Folder Structure</h3>
    <p>The project follows a <strong>clean architecture</strong>:</p>
    <ul>
        <li><code>lib/pages</code>: Contains feature-specific pages.
            <ul>
                <li><code>binding.dart</code>: Handles dependency injection for the page.</li>
                <li><code>controller.dart</code>: Manages the business logic.</li>
                <li><code>view.dart</code>: The UI implementation.</li>
            </ul>
        </li>
        <li><code>lib/models</code>: Defines data models used in the app.</li>
        <li><code>lib/services</code>: Handles data persistence and communication with Hive.</li>
    </ul>
    <hr>
    <h2 id="usage">Usage</h2>
    <ul>
        <li><strong>Add Notes:</strong> Tap the "+" button, enter your note, and save.</li>
        <li><strong>Delete Notes:</strong> Swipe a note to delete it.</li>
    </ul>
    <hr>
    <h2>Future Enhancements</h2>
    <ul>
        <li>Add categories for notes.</li>
        <li>Implement cloud sync for multi-device access.</li>
        <li>Add search and filtering capabilities.</li>
    </ul>
    <hr>
    <h2>Contributing</h2>
    <p>Contributions are welcome! Feel free to submit a pull request or file an issue.</p>
    <hr>
    <h2>License</h2>
    <p>This project is licensed under the MIT License.</p>
</body>
</html>
