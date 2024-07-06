# Contextions

Contextions is a Flutter package which makes use of extension methods on BuildContext to easily access Navigator functions, theme functions, and other BuildContext-based functions. This package enhances convenience and readability in Flutter app development.

## Features

### Navigation

Easily navigate to new pages and manage navigation stack:

```dart
context.to(YourPage());
context.navigateAndReplace(YourPage());
context.pop();
```

### Theme and MediaQuery

Access theme data and media query properties directly from `BuildContext`:

```dart
ThemeData theme = context.theme;
TextTheme textTheme = context.textTheme;
Size screenSize = context.screenSize;
double screenHeight = context.screenHeight;
double screenWidth = context.screenWidth;
```

### Snackbar

Show snackbar messages with a single line of code:

```dart
context.showSnackbar('Message');
```

### Dialog

Display dialogs with custom content and actions:

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

### Drawer

Open and close the drawer:

```dart
context.openDrawer();
context.closeDrawer();
```

### Modal Bottom Sheet

Show a modal bottom sheet:

```dart
context.showModalBottomSheetX(
  Container(
    child: Text('Bottom Sheet Content'),
  ),
);
```

### Bottom Sheet

Show a customizable bottom sheet:

```dart
context.showBottomSheetX(
  builder: (BuildContext context) => Container(
    child: Text('Custom Bottom Sheet Content'),
  ),
);
```

### Search

Show a search interface:

```dart
context.showSearchX(
  delegate: CustomSearchDelegate(),
);
```

### Dialog with Custom Content and Actions

Show a dialog with custom content and actions:

```dart
context.showDialogXY(
  title: 'Custom Dialog Title',
  content: 'Custom Dialog Content',
  actions: [
    TextButton(
      onPressed: () => context.pop(),
      child: Text('OK'),
    ),
  ],
);
```

### Keyboard Visibility

Check if the keyboard is visible:

```dart
bool isKeyboardVisible = context.isKeyboardVisible;
```

### Screen Orientation

Check if the screen is in landscape or portrait mode:

```dart
bool isLandscape = context.isLandscape;
bool isPortrait = context.isPortrait;
```

### Example

Here's a basic example demonstrating the usage of `contextions`:

```dart
import 'package:flutter/material.dart';
import 'package:contextions/context_extensions.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Context Extensions Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.showSnackbar('Hello from Context Extensions!');
          },
          child: Text('Show Snackbar'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyWidget(),
  ));
}
```