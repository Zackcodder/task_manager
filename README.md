# Task Manager App

## 📌 Overview

This Flutter application allows users to manage tasks efficiently with local storage and push notifications. The app enables users to create, edit, delete tasks, and receive a reminder notification 5 minutes after adding a task.

## 📲 Features

- **Task Management**: Create, edit, and delete tasks.
- **Push Notifications**: Sends a reminder notification 5 minutes after task creation.
- **Local Data Storage**: Uses Hive for offline task storage.
- **State Management**: Implements Provider for managing app state.

## 🛠️ Technologies Used

- **Flutter** (Dart)
- **Hive** (Local Storage)
- **Provider** (State Management)
- **Flutter Local Notifications** (Push Notifications)
- **Flutter Timezone** (Timezone Handling)

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed:

- Flutter SDK
- Dart SDK
- Android Studio / VS Code (or any Flutter-supported IDE)

### 🔧 Installation

1. **Clone the repository:**

   ```sh
   git clone https://github.com/yourusername/task_manager.git
   cd task_manager
   ```

2. **Install dependencies:**

   ```sh
   flutter pub get
   ```

3. **Run the app:**

   ```sh
   flutter run
   ```

## 📂 Project Structure

/lib
│── main.dart  # Entry point of the app
│── models
│   └── task_model.dart  # Task model for Hive storage
│── services
│   ├── db_service.dart  # Handles local database operations
│   ├── notification_service.dart  # Handles scheduling notifications
│── provider
│   └── task_provider.dart  # Manages task state using Provider
│── screens
│   ├── task_list_screen.dart  # Displays task list
│   ├── task_form_screen.dart  # Allows adding/editing tasks
│── widgets
│   ├── task_tile.dart  # Task UI component
│── utils
│   └── timezone_setup.dart  # Configures timezone settings
