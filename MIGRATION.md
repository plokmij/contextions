# Migration Guide

## From version 0.0.1 to 0.1.0

### Replacing [`navigateTo`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fsamfan%2FDevelopment%2Fpackages%2Fcontextions%2FMIGRATION.md%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A4%2C%22character%22%3A0%7D%5D "MIGRATION.md") with [`to`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fsamfan%2FDevelopment%2Fpackages%2Fcontextions%2FMIGRATION.md%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A2%2C%22character%22%3A0%7D%5D "MIGRATION.md")

In your code, find instances of [`navigateTo`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fsamfan%2FDevelopment%2Fpackages%2Fcontextions%2FMIGRATION.md%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A4%2C%22character%22%3A0%7D%5D "MIGRATION.md") and replace them with [`to`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fsamfan%2FDevelopment%2Fpackages%2Fcontextions%2FMIGRATION.md%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A2%2C%22character%22%3A0%7D%5D "MIGRATION.md"). Here’s an example:

```dart
// Before
context.navigateTo(YourPage());

// After
context.to(YourPage());
```

## From version 0.1.0 to 0.2.0

### Replacing `navigateAndReplace` with `replace`

The `navigateAndReplace` method has been deprecated in favor of the new `replace` method to align with naming conventions and improve readability. Update your code as follows:

```dart
// Before
context.navigateAndReplace(YourPage());

// After
context.replace(YourPage());
```

### New Methods for Dialogs, Bottom Sheets, and Keyboard Visibility

Version 0.2.0 introduces several new methods for showing dialogs, bottom sheets, and checking keyboard visibility. Here are a few examples of how to use these new methods:

#### Showing a Dialog

```dart
context.showDialogX(
  AlertDialog(
    title: Text('Dialog Title'),
    content: Text('Dialog Content'),
    actions: [
      TextButton(
        onPressed: () => context.pop(),
        child: Text('OK'),
      ),
    ],
  ),
);
```

#### Showing a Modal Bottom Sheet

```dart
context.showModalBottomSheetX(
  Container(
    child: Text('Bottom Sheet Content'),
  ),
);
```

#### Checking Keyboard Visibility

```dart
bool isKeyboardVisible = context.isKeyboardVisible;
```

Please review the updated documentation for a full list of new methods and enhancements.