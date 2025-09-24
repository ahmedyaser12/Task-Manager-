# Interactive Dismissible List

A Flutter Task manager app demonstrating interactive UI patterns with dismissible and reorderable list items.

## Features

- ✅ **Task Management** - Mark tasks as done/undone with checkboxes
- 🗑️ **Swipe to Delete** - Swipe right-to-left to delete tasks with confirmation dialog
- ↩️ **Undo Functionality** - Restore deleted tasks with snackbar undo action
- 📱 **Drag to Reorder** - Reorder tasks by dragging the handle icon
- 🎨 **Clean UI** - Material Design with intuitive interactions

## Screenshots

*Add your app screenshots here*

## How to Use

1. **Mark Complete**: Tap the checkbox to mark tasks as done/undone
2. **Delete Task**: Swipe left on any task → Confirm deletion → Use "Undo" if needed
3. **Reorder Tasks**: Drag the handle icon (☰) to reorder tasks

## Getting Started

### Prerequisites
- Flutter SDK (latest version)
- Dart SDK
- Android Studio / VS Code

### Installation

1. Clone the repository:
```bash
git clone https://github.com/ahmedyaser12/Task-Manager-.git
cd Task-Manager-
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                          # App entry point
└── task_manager/
    ├── task_manager.dart             # Main UI widget
    └── data/
        └── task_data.dart            # Data models and controller
```

## Architecture

- **TaskModel**: Data model for individual tasks
- **TaskData**: Provides initial task data
- **TaskController**: Handles task operations (CRUD)
- **TaskManager**: Main UI widget with state management

## Testing

Run unit tests:
```bash
flutter test
```

## Built With

- [Flutter](https://flutter.dev/) - UI framework
- [Material Design](https://material.io/) - Design system

## What I Learned

- Flutter dismissible widgets and gesture handling
- State management with StatefulWidget
- Reorderable list implementation
- Dialog and snackbar interactions
- Clean architecture patterns

## Contributing

Pull requests are welcome! Please feel free to submit issues and enhancement requests.